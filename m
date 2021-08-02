Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8213DDDB4
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 18:30:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26E503C8AF5
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 18:30:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54BE03C57C1
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 18:30:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A4138200345
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 18:30:34 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E86631FFBE;
 Mon,  2 Aug 2021 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627921833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KBxiWe4SoJtxxxYs6W8+EDh9108+1r/OgcAyGezjh0w=;
 b=QgyhDhWkvM3h/v42VE2L/fEpmKzEW3ewhK+C3fc6Y4MAoCcxA1DrPj2/zYb0JemX7YYv38
 qHRiL6QWu/COitsn3FlMahQyZZ9pgSg5KOCMg39j6zgBf97Grvb1PG8yF4CeJyg16kuSUZ
 WRpYUAvdfossz9F26ULWFK8z3yVaAHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627921833;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KBxiWe4SoJtxxxYs6W8+EDh9108+1r/OgcAyGezjh0w=;
 b=6DH5tCt6iezw1an+k937ajgNPuQ+fHzYboJ1nnZONcPhLdqD9UEE/BTB0FFJekO+vn2c8k
 6OdKpY1/DO2u5NCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B44DA13B3F;
 Mon,  2 Aug 2021 16:30:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +93ZKakdCGFWHQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 16:30:33 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 18:30:07 +0200
Message-Id: <20210802163007.2282-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] openposix/pthread_cancel/3-1: Move sleep loop
 into separate function
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

dG8gZml4IHdhcm5pbmc6CnB0aHJlYWRfY2FuY2VsLzMtMS5jOjQwOjEzOiB3YXJuaW5nOiB2YXJp
YWJsZSDigJh3YWl0ZWRfZm9yX2NhbmNlbF9tc+KAmSBtaWdodCBiZSBjbG9iYmVyZWQgYnkg4oCY
bG9uZ2ptcOKAmSBvciDigJh2Zm9ya+KAmSBbLVdjbG9iYmVyZWRdCiAgIDQwIHwgICAgICAgICBp
bnQgd2FpdGVkX2Zvcl9jYW5jZWxfbXMgPSAwOwoKU3VnZ2VzdGVkLWJ5OiBNYXJ0aW4gRG91Y2hh
IDxtZG91Y2hhQHN1c2UuY3o+ClNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PgotLS0KIC4uLi9jb25mb3JtYW5jZS9pbnRlcmZhY2VzL3B0aHJlYWRfY2FuY2VsLzMtMS5j
ICB8IDE2ICsrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3Rz
dWl0ZS9jb25mb3JtYW5jZS9pbnRlcmZhY2VzL3B0aHJlYWRfY2FuY2VsLzMtMS5jIGIvdGVzdGNh
c2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZvcm1hbmNlL2ludGVyZmFjZXMvcHRocmVhZF9j
YW5jZWwvMy0xLmMKaW5kZXggMzUyN2Q1N2ZkLi45MDUwMGIzNzEgMTAwNjQ0Ci0tLSBhL3Rlc3Rj
YXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3JtYW5jZS9pbnRlcmZhY2VzL3B0aHJlYWRf
Y2FuY2VsLzMtMS5jCisrKyBiL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3Jt
YW5jZS9pbnRlcmZhY2VzL3B0aHJlYWRfY2FuY2VsLzMtMS5jCkBAIC0zNSwxOSArMzUsMjUgQEAg
c3RhdGljIHZvaWQgY2xlYW51cF9mdW5jKFBUU19BVFRSSUJVVEVfVU5VU0VEIHZvaWQgKnVudXNl
ZCkKIAl9IHdoaWxlIChhZnRlcl9jYW5jZWwgPT0gMCAmJiB0aHJlYWRfc2xlZXBfdGltZSA8IFRJ
TUVPVVRfTVMpOwogfQogCi1zdGF0aWMgdm9pZCAqdGhyZWFkX2Z1bmMoUFRTX0FUVFJJQlVURV9V
TlVTRUQgdm9pZCAqdW51c2VkKQorc3RhdGljIHZvaWQgc2xlZXBfbG9vcCh2b2lkKQogewogCWlu
dCB3YWl0ZWRfZm9yX2NhbmNlbF9tcyA9IDA7CiAJc3RydWN0IHRpbWVzcGVjIGNhbmNlbF93YWl0
X3RzID0gezAsIFNMRUVQX01TKjEwMDAwMDB9OwogCi0JU0FGRV9QRlVOQyhwdGhyZWFkX3NldGNh
bmNlbHR5cGUoUFRIUkVBRF9DQU5DRUxfQVNZTkNIUk9OT1VTLCBOVUxMKSk7Ci0JcHRocmVhZF9j
bGVhbnVwX3B1c2goY2xlYW51cF9mdW5jLCBOVUxMKTsKLQotCVNBRkVfRlVOQyhzZW1fcG9zdCgm
c2VtKSk7CiAJd2hpbGUgKHdhaXRlZF9mb3JfY2FuY2VsX21zIDwgVElNRU9VVF9NUykgewogCQlu
YW5vc2xlZXAoJmNhbmNlbF93YWl0X3RzLCBOVUxMKTsKIAkJd2FpdGVkX2Zvcl9jYW5jZWxfbXMg
Kz0gU0xFRVBfTVM7CiAJfQorfQorCitzdGF0aWMgdm9pZCAqdGhyZWFkX2Z1bmMoUFRTX0FUVFJJ
QlVURV9VTlVTRUQgdm9pZCAqdW51c2VkKQoreworCVNBRkVfUEZVTkMocHRocmVhZF9zZXRjYW5j
ZWx0eXBlKFBUSFJFQURfQ0FOQ0VMX0FTWU5DSFJPTk9VUywgTlVMTCkpOworCXB0aHJlYWRfY2xl
YW51cF9wdXNoKGNsZWFudXBfZnVuYywgTlVMTCk7CisKKwlTQUZFX0ZVTkMoc2VtX3Bvc3QoJnNl
bSkpOworCisJc2xlZXBfbG9vcCgpOwogCiAJLyogc2hvdWxkbid0IGJlIHJlYWNoZWQgKi8KIAlw
cmludGYoIkVycm9yOiBjYW5jZWwgbmV2ZXIgYXJyaXZlZFxuIik7Ci0tIAoyLjMyLjAKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
