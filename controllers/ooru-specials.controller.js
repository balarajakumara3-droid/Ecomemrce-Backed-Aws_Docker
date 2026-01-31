/**
 * controllers/ooru-specials.controller.js - Ooru Specials HTTP Handlers
 */

const ooruSpecialsService = require('../services/ooru-specials.service');

const getAllSpecials = async (req, res, next) => {
    try {
        const specials = await ooruSpecialsService.getAllSpecials();
        res.status(200).json({ success: true, data: specials });
    } catch (error) {
        next(error);
    }
};

const getSpecialBySlug = async (req, res, next) => {
    try {
        const special = await ooruSpecialsService.getSpecialBySlug(req.params.slug);
        if (!special) {
            return res.status(404).json({ success: false, message: 'Special not found' });
        }
        res.status(200).json({ success: true, data: special });
    } catch (error) {
        next(error);
    }
};

const createSpecial = async (req, res, next) => {
    try {
        const special = await ooruSpecialsService.createSpecial(req.body);
        res.status(201).json({ success: true, data: special });
    } catch (error) {
        next(error);
    }
};

const updateSpecial = async (req, res, next) => {
    try {
        const special = await ooruSpecialsService.updateSpecial(req.params.id, req.body);
        res.status(200).json({ success: true, data: special });
    } catch (error) {
        next(error);
    }
};

const deleteSpecial = async (req, res, next) => {
    try {
        await ooruSpecialsService.deleteSpecial(req.params.id);
        res.status(200).json({ success: true, message: 'Special deleted' });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    getAllSpecials,
    getSpecialBySlug,
    createSpecial,
    updateSpecial,
    deleteSpecial
};