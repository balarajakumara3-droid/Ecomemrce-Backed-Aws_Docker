CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    admin_id UUID,
    entity_type VARCHAR NOT NULL,  -- 'product', 'order', 'user', etc.
    entity_id UUID,
    action VARCHAR NOT NULL,        -- 'create', 'update', 'delete'
    payload JSONB,                  -- Changed data
    ip_address INET,
    user_agent TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT audit_logs_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES profiles(id)
);

CREATE INDEX idx_audit_logs_admin ON audit_logs(admin_id);
CREATE INDEX idx_audit_logs_entity ON audit_logs(entity_type, entity_id);
CREATE INDEX idx_audit_logs_created ON audit_logs(created_at);