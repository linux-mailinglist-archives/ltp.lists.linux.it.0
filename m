Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E575A9FD5F2
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Dec 2024 17:24:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A78923EF623
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Dec 2024 17:24:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 816703EF571
 for <ltp@lists.linux.it>; Fri, 27 Dec 2024 17:24:27 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5F05D218373
 for <ltp@lists.linux.it>; Fri, 27 Dec 2024 17:24:25 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5312721D46;
 Fri, 27 Dec 2024 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735316664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OtKdMwL/I4QyDgzCQ/rP6wu+ko3246FQ8NtpcsqblQg=;
 b=q8VsK2P0zpln177/vm8VVOwrqa/NjlraMg3RJsFMHzAFqti4+WJ+c5DhSxap48sSc3dF4k
 G9mgH6YJ89kmSsH2cGPIae1F2pBhNmK5FgIb5gtWsjZalA/NIfdf2GyTPZdS8tDquPNKRi
 SsKhp06oDWAcD++tx1daxe9B8croFGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735316664;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OtKdMwL/I4QyDgzCQ/rP6wu+ko3246FQ8NtpcsqblQg=;
 b=+9GI8hZkSC3aM2JZGHcJWEs4xz6EdPwvJNTnFCANQE8uTnU8v3wW9HaIHl7kiIbAkenZOI
 a34iG2OOkzPQBQBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=q8VsK2P0;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=+9GI8hZk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1735316664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OtKdMwL/I4QyDgzCQ/rP6wu+ko3246FQ8NtpcsqblQg=;
 b=q8VsK2P0zpln177/vm8VVOwrqa/NjlraMg3RJsFMHzAFqti4+WJ+c5DhSxap48sSc3dF4k
 G9mgH6YJ89kmSsH2cGPIae1F2pBhNmK5FgIb5gtWsjZalA/NIfdf2GyTPZdS8tDquPNKRi
 SsKhp06oDWAcD++tx1daxe9B8croFGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1735316664;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OtKdMwL/I4QyDgzCQ/rP6wu+ko3246FQ8NtpcsqblQg=;
 b=+9GI8hZkSC3aM2JZGHcJWEs4xz6EdPwvJNTnFCANQE8uTnU8v3wW9HaIHl7kiIbAkenZOI
 a34iG2OOkzPQBQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B99413985;
 Fri, 27 Dec 2024 16:24:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id o8QjAbjUbmf4JQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 27 Dec 2024 16:24:24 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Dec 2024 17:24:20 +0100
Message-ID: <20241227162421.367893-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: 5312721D46
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:email,suse.cz:dkim,suse.cz:mid];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] device-drivers: Fix module build on kernel >= 5.18
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
Cc: "Ricardo B . Marliere" <rbm@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

U2ltaWxhcmx5IHRvIDgyZTM4YTFmMjQgd3JhcCA8bGludXgvZ2VuaGQuaD4gd2l0aCBpZm5kZWYu
IFRoaXMgZml4ZXMKbW9kdWxlIGJ1aWxkIG9uIDUuMTggYW5kIG5ld2VyIHdoZXJlIDxsaW51eC9n
ZW5oZC5oPiB3YXMgbWVyZ2VkIGludG8KPGxpbnV4L2Jsa2Rldi5oPi4KCk5PVEU6IGx0cF9hY3Bp
X2NtZHMuYyBrZXB0IHVuZml4ZWQgYmVjYXVzZSBhY3BpX2J1c19nZXRfZGV2aWNlKCkgcmVtb3Zl
ZAppbiA1LjE4IGluIGFjMmEzZmVlZmFkNTQgKCJBQ1BJOiBidXM6IEVsaW1pbmF0ZSBhY3BpX2J1
c19nZXRfZGV2aWNlKCkiKQoocmVwbGFjZWQgYnkgYWNwaV9mZXRjaF9hY3BpX2RldigpLikKClNp
Z25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgotLS0KSGksCgp0aGVyZSBh
cmUgbW9yZSB0aGluZ3MgdG8gZml4OgpubHNUZXN0LmM6NDA6MTA6IGZhdGFsIGVycm9yOiBsaW51
eC9hdXRvY29uZi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CgpJIG5lZWQgbW9yZSB0aW1l
IGZvciBsdHBfYWNwaV9jbWRzLmMuIEhvcGVmdWxseSBBQ1BJX1NVQ0NFU1Moc3RhdHVzKQpjb3Vs
ZCBiZSBqdXN0IHJlcGxhY2VkIHdpdGggZGV0ZWN0aW5nIGlmIHJldHVybmVkIGRldmljZSBpcyBu
b3QgbnVsbC4KCktpbmQgcmVnYXJkcywKUGV0cgoKKysrIHRlc3RjYXNlcy9rZXJuZWwvZGV2aWNl
LWRyaXZlcnMvYWNwaS9sdHBfYWNwaV9jbWRzLmMKQEAgLTM2LDcgKzM2LDkgQEAKICNpbmNsdWRl
IDxsaW51eC9pb2N0bC5oPgogI2luY2x1ZGUgPGxpbnV4L3BtLmg+CiAjaW5jbHVkZSA8bGludXgv
YWNwaS5oPgorI2lmbmRlZiBESVNLX05BTUVfTEVOCiAjIGluY2x1ZGUgPGxpbnV4L2dlbmhkLmg+
CisjZW5kaWYKICNpbmNsdWRlIDxsaW51eC9kbWkuaD4KICNpbmNsdWRlIDxsaW51eC9ubHMuaD4K
IApAQCAtMTMwLDggKzEzMiwxMyBAQCBzdGF0aWMgdm9pZCBnZXRfc3lzZnNfcGF0aChhY3BpX2hh
bmRsZSBoYW5kbGUpCiAJa2ZyZWUoc3lzZnNfcGF0aCk7CiAJc3lzZnNfcGF0aCA9IE5VTEw7CiAK
KyNpZm5kZWYgRElTS19OQU1FX0xFTgogCXN0YXR1cyA9IGFjcGlfYnVzX2dldF9kZXZpY2UoaGFu
ZGxlLCAmZGV2aWNlKTsKIAlpZiAoQUNQSV9TVUNDRVNTKHN0YXR1cykpCisjZWxzZQorCWRldmlj
ZSA9IGFjcGlfZmV0Y2hfYWNwaV9kZXYoaGFuZGxlKTsKKyNlbmRpZgorCWlmICghZGV2aWNlKQog
CQlzeXNmc19wYXRoID0ga29iamVjdF9nZXRfcGF0aCgmZGV2aWNlLT5kZXYua29iaiwgR0ZQX0tF
Uk5FTCk7CiB9CiAKQEAgLTM5OSw5ICs0MDYsMTUgQEAgc3RhdGljIGludCBhY3BpX3Rlc3RfYnVz
KHZvaWQpCiAJaWYgKGFjcGlfZmFpbHVyZShzdGF0dXMsICJhY3BpX2dldF9oYW5kbGUiKSkKIAkJ
cmV0dXJuIDE7CiAKKyNpZm5kZWYgRElTS19OQU1FX0xFTgogCXBya19hbGVydCgiVEVTVCAtLSBh
Y3BpX2J1c19nZXRfZGV2aWNlIik7CiAJc3RhdHVzID0gYWNwaV9idXNfZ2V0X2RldmljZShidXNf
aGFuZGxlLCAmZGV2aWNlKTsKIAlpZiAoYWNwaV9mYWlsdXJlKHN0YXR1cywgImFjcGlfYnVzX2dl
dF9kZXZpY2UiKSkKKyNlbHNlCisJcHJrX2FsZXJ0KCJURVNUIC0tIGFjcGlfZmV0Y2hfYWNwaV9k
ZXYiKTsKKwlkZXZpY2UgPSBhY3BpX2ZldGNoX2FjcGlfZGV2KGJ1c19oYW5kbGUpOworCWlmICgh
ZGV2aWNlKQorI2VuZGlmCiAJCXJldHVybiAxOwogCiAJcHJrX2FsZXJ0KCJURVNUIC0tIGFjcGlf
YnVzX3VwZGF0ZV9wb3dlciAiKTsKCgogdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9h
Y3BpL2x0cF9hY3BpX2NtZHMuYyAgICAgICAgICB8IDMgKystCiAuLi4va2VybmVsL2RldmljZS1k
cml2ZXJzL2Jsb2NrL2Jsb2NrX2Rldl9rZXJuZWwvdGVzdF9nZW5oZC5jIHwgNCArKystCiB0ZXN0
Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2luY2x1ZGUvaW5jbHVkZVRlc3QuYyAgICAgICAg
IHwgNCArKystCiB0ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL25scy9ubHNUZXN0LmMg
ICAgICAgICAgICAgICAgIHwgNCArKystCiB0ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJz
L3RiaW8vdGJpb19rZXJuZWwvbHRwX3RiaW8uYyAgIHwgNCArKystCiA1IGZpbGVzIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2Vz
L2tlcm5lbC9kZXZpY2UtZHJpdmVycy9hY3BpL2x0cF9hY3BpX2NtZHMuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvZGV2aWNlLWRyaXZlcnMvYWNwaS9sdHBfYWNwaV9jbWRzLmMKaW5kZXggZDEyZGQ2Yjk0
Yy4uODVlZTZlMzQ4OCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVy
cy9hY3BpL2x0cF9hY3BpX2NtZHMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2
ZXJzL2FjcGkvbHRwX2FjcGlfY21kcy5jCkBAIC0zNiwxMCArMzYsMTEgQEAKICNpbmNsdWRlIDxs
aW51eC9pb2N0bC5oPgogI2luY2x1ZGUgPGxpbnV4L3BtLmg+CiAjaW5jbHVkZSA8bGludXgvYWNw
aS5oPgotI2luY2x1ZGUgPGxpbnV4L2dlbmhkLmg+CisjIGluY2x1ZGUgPGxpbnV4L2dlbmhkLmg+
CiAjaW5jbHVkZSA8bGludXgvZG1pLmg+CiAjaW5jbHVkZSA8bGludXgvbmxzLmg+CiAKKwogI2lu
Y2x1ZGUgImx0cF9hY3BpLmgiCiAKIE1PRFVMRV9BVVRIT1IoIk1hcnRpbiBSaWRnZXdheSA8bXJp
ZGdlQHVzLmlibS5jb20+Iik7CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1k
cml2ZXJzL2Jsb2NrL2Jsb2NrX2Rldl9rZXJuZWwvdGVzdF9nZW5oZC5jIGIvdGVzdGNhc2VzL2tl
cm5lbC9kZXZpY2UtZHJpdmVycy9ibG9jay9ibG9ja19kZXZfa2VybmVsL3Rlc3RfZ2VuaGQuYwpp
bmRleCBkMzRhMjM2YjQxLi4yMjU4NDA1MjVjIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVs
L2RldmljZS1kcml2ZXJzL2Jsb2NrL2Jsb2NrX2Rldl9rZXJuZWwvdGVzdF9nZW5oZC5jCisrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvYmxvY2svYmxvY2tfZGV2X2tlcm5lbC90
ZXN0X2dlbmhkLmMKQEAgLTEzLDcgKzEzLDkgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+Ci0jaW5jbHVkZSA8bGludXgvZ2VuaGQuaD4KKyNpZm5kZWYgRElTS19OQU1FX0xFTgor
IyBpbmNsdWRlIDxsaW51eC9nZW5oZC5oPgorI2VuZGlmCiAKIE1PRFVMRV9BVVRIT1IoIk3DoXJ0
b24gTsOpbWV0aCA8bm0xMjdAZnJlZW1haWwuaHU+Iik7CiBNT0RVTEVfREVTQ1JJUFRJT04oIlRl
c3QgYmxvY2sgZHJpdmVycyIpOwpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2Ut
ZHJpdmVycy9pbmNsdWRlL2luY2x1ZGVUZXN0LmMgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1k
cml2ZXJzL2luY2x1ZGUvaW5jbHVkZVRlc3QuYwppbmRleCBkNWI2ZmUyMjlkLi41ZjlhOGYyNDRh
IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2luY2x1ZGUvaW5j
bHVkZVRlc3QuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2luY2x1ZGUv
aW5jbHVkZVRlc3QuYwpAQCAtMzMsNyArMzMsOSBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
PgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KICNpbmNsdWRlIDxsaW51eC9wbS5oPgotI2luY2x1
ZGUgPGxpbnV4L2dlbmhkLmg+CisjaWZuZGVmIERJU0tfTkFNRV9MRU4KKyMgaW5jbHVkZSA8bGlu
dXgvZ2VuaGQuaD4KKyNlbmRpZgogI2luY2x1ZGUgPGxpbnV4L2luLmg+CiAjaW5jbHVkZSA8YXNt
L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvbG9ja2QvYmluZC5oPgpkaWZmIC0tZ2l0IGEvdGVz
dGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9ubHMvbmxzVGVzdC5jIGIvdGVzdGNhc2VzL2tl
cm5lbC9kZXZpY2UtZHJpdmVycy9ubHMvbmxzVGVzdC5jCmluZGV4IGYwYzM5YWI5ZmUuLmM2ODEz
YTFjYjEgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvbmxzL25s
c1Rlc3QuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL25scy9ubHNUZXN0
LmMKQEAgLTMxLDcgKzMxLDkgQEAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgvcG0uaD4KLSNpbmNsdWRlIDxsaW51eC9n
ZW5oZC5oPgorI2lmbmRlZiBESVNLX05BTUVfTEVOCisjIGluY2x1ZGUgPGxpbnV4L2dlbmhkLmg+
CisjZW5kaWYKICNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+CiAjaW5jbHVkZSA8bGludXgvc3Ry
aW5nLmg+CiAjaW5jbHVkZSA8bGludXgvYXV0b2NvbmYuaD4KZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvdGJpby90YmlvX2tlcm5lbC9sdHBfdGJpby5jIGIvdGVz
dGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy90YmlvL3RiaW9fa2VybmVsL2x0cF90YmlvLmMK
aW5kZXggMGE5Y2Q0MGViYi4uZmQ1OGViOWI5NCAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9kZXZpY2UtZHJpdmVycy90YmlvL3RiaW9fa2VybmVsL2x0cF90YmlvLmMKKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy90YmlvL3RiaW9fa2VybmVsL2x0cF90YmlvLmMKQEAg
LTQzLDcgKzQzLDkgQEAKICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgotI2luY2x1ZGUgPGxpbnV4L2dl
bmhkLmg+CisjaWZuZGVmIERJU0tfTkFNRV9MRU4KKyMgaW5jbHVkZSA8bGludXgvZ2VuaGQuaD4K
KyNlbmRpZgogI2luY2x1ZGUgPGxpbnV4L2Jsa2Rldi5oPgogI2luY2x1ZGUgPGxpbnV4L2J1ZmZl
cl9oZWFkLmg+CiAKLS0gCjIuNDUuMgoKIC4uLi9kZXZpY2UtZHJpdmVycy9ibG9jay9ibG9ja19k
ZXZfa2VybmVsL3Rlc3RfZ2VuaGQuYyAgICAgIHwgNSArKysrLQogdGVzdGNhc2VzL2tlcm5lbC9k
ZXZpY2UtZHJpdmVycy9pbmNsdWRlL2luY2x1ZGVUZXN0LmMgICAgICAgfCA1ICsrKystCiB0ZXN0
Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL25scy9ubHNUZXN0LmMgICAgICAgICAgICAgICB8
IDYgKysrKy0tCiB0ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3RiaW8vdGJpb19rZXJu
ZWwvbHRwX3RiaW8uYyB8IDQgKysrLQogNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRy
aXZlcnMvYmxvY2svYmxvY2tfZGV2X2tlcm5lbC90ZXN0X2dlbmhkLmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL2RldmljZS1kcml2ZXJzL2Jsb2NrL2Jsb2NrX2Rldl9rZXJuZWwvdGVzdF9nZW5oZC5jCmlu
ZGV4IGQzNGEyMzZiNDEuLmUyZjY4N2MxNzMgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwv
ZGV2aWNlLWRyaXZlcnMvYmxvY2svYmxvY2tfZGV2X2tlcm5lbC90ZXN0X2dlbmhkLmMKKysrIGIv
dGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9ibG9jay9ibG9ja19kZXZfa2VybmVsL3Rl
c3RfZ2VuaGQuYwpAQCAtMTMsNyArMTMsMTAgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+Ci0jaW5jbHVkZSA8bGludXgvZ2VuaGQuaD4KKyNpbmNsdWRlIDxsaW51eC9ibGtkZXYu
aD4KKyNpZm5kZWYgRElTS19OQU1FX0xFTgorIyBpbmNsdWRlIDxsaW51eC9nZW5oZC5oPgorI2Vu
ZGlmCiAKIE1PRFVMRV9BVVRIT1IoIk3DoXJ0b24gTsOpbWV0aCA8bm0xMjdAZnJlZW1haWwuaHU+
Iik7CiBNT0RVTEVfREVTQ1JJUFRJT04oIlRlc3QgYmxvY2sgZHJpdmVycyIpOwpkaWZmIC0tZ2l0
IGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9pbmNsdWRlL2luY2x1ZGVUZXN0LmMg
Yi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2luY2x1ZGUvaW5jbHVkZVRlc3QuYwpp
bmRleCBkNWI2ZmUyMjlkLi4xMzQwYWJiYzQwIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVs
L2RldmljZS1kcml2ZXJzL2luY2x1ZGUvaW5jbHVkZVRlc3QuYworKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL2RldmljZS1kcml2ZXJzL2luY2x1ZGUvaW5jbHVkZVRlc3QuYwpAQCAtMzMsNyArMzMsMTAg
QEAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+CiAj
aW5jbHVkZSA8bGludXgvcG0uaD4KLSNpbmNsdWRlIDxsaW51eC9nZW5oZC5oPgorI2luY2x1ZGUg
PGxpbnV4L2Jsa2Rldi5oPgorI2lmbmRlZiBESVNLX05BTUVfTEVOCisjIGluY2x1ZGUgPGxpbnV4
L2dlbmhkLmg+CisjZW5kaWYKICNpbmNsdWRlIDxsaW51eC9pbi5oPgogI2luY2x1ZGUgPGFzbS90
eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L2xvY2tkL2JpbmQuaD4KZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvbmxzL25sc1Rlc3QuYyBiL3Rlc3RjYXNlcy9rZXJu
ZWwvZGV2aWNlLWRyaXZlcnMvbmxzL25sc1Rlc3QuYwppbmRleCBmMGMzOWFiOWZlLi41MTBmN2Qy
NTI4IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL25scy9ubHNU
ZXN0LmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9ubHMvbmxzVGVzdC5j
CkBAIC0zMSwxMiArMzEsMTQgQEAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgvcG0uaD4KLSNpbmNsdWRlIDxsaW51eC9n
ZW5oZC5oPgorI2luY2x1ZGUgPGxpbnV4L2Jsa2Rldi5oPgorI2lmbmRlZiBESVNLX05BTUVfTEVO
CisjIGluY2x1ZGUgPGxpbnV4L2dlbmhkLmg+CisjZW5kaWYKICNpbmNsdWRlIDxsaW51eC92ZXJz
aW9uLmg+CiAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+CiAjaW5jbHVkZSA8bGludXgvYXV0b2Nv
bmYuaD4KICNpbmNsdWRlIDxsaW51eC9ubHMuaD4KLSNpbmNsdWRlIDxsaW51eC9ibGtkZXYuaD4K
IAogI2lmZGVmIENPTkZJR19LTU9ECiAjaW5jbHVkZSA8bGludXgva21vZC5oPgpkaWZmIC0tZ2l0
IGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy90YmlvL3RiaW9fa2VybmVsL2x0cF90
YmlvLmMgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3RiaW8vdGJpb19rZXJuZWwv
bHRwX3RiaW8uYwppbmRleCAwYTljZDQwZWJiLi5hZmFkZmU3Yjk2IDEwMDY0NAotLS0gYS90ZXN0
Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3RiaW8vdGJpb19rZXJuZWwvbHRwX3RiaW8uYwor
KysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3RiaW8vdGJpb19rZXJuZWwvbHRw
X3RiaW8uYwpAQCAtNDMsOCArNDMsMTAgQEAKICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgotI2luY2x1
ZGUgPGxpbnV4L2dlbmhkLmg+CiAjaW5jbHVkZSA8bGludXgvYmxrZGV2Lmg+CisjaWZuZGVmIERJ
U0tfTkFNRV9MRU4KKyMgaW5jbHVkZSA8bGludXgvZ2VuaGQuaD4KKyNlbmRpZgogI2luY2x1ZGUg
PGxpbnV4L2J1ZmZlcl9oZWFkLmg+CiAKICNpbmNsdWRlICJ0YmlvLmgiCi0tIAoyLjQ1LjIKCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
