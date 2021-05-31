Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A012E395434
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 05:29:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10FEB3C807A
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 05:29:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB4C93C2991
 for <ltp@lists.linux.it>; Mon, 31 May 2021 05:29:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8952C1400533
 for <ltp@lists.linux.it>; Mon, 31 May 2021 05:29:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E701B1FD2E;
 Mon, 31 May 2021 03:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622431757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U8z9sFxuLmDrXKy+7RcdXv0FZ/Sza9pVfl9EEvwaRI8=;
 b=zHGKm6bry7rkPDoApzApVZ5mkiWQ1u3wSCtb3Ae0o9hrc1rmcLUcuPoJrf3jAdtFlKdfOP
 rbWdlRrAyq205IaJZVj6dMEQd4D7MhHm9N2L2tCEPKc6O1PRTOEKcu5onmmUHDFt+yMO1j
 vFkSPM4W5xUZGxGbeTH1BvNDSLqNZpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622431757;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U8z9sFxuLmDrXKy+7RcdXv0FZ/Sza9pVfl9EEvwaRI8=;
 b=x3lxq9eXmeJsEQbe5DbRchRWneIaJxDholmk4/K5ZfIK1EzDKhBT/6VAVCYef4uoSrBy4A
 gpRHQxUz9Bak+jCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B268C118DD;
 Mon, 31 May 2021 03:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622431756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U8z9sFxuLmDrXKy+7RcdXv0FZ/Sza9pVfl9EEvwaRI8=;
 b=iNf1bHqrVuD0xKaxgj+QtJpdljbPgC3x4HiTp3grikGfL6By7zkEwuU8qCJB0TE8VUTbf8
 TNOjARXCT1en5klRktoLcbjq7R4Vl5s3esxYHWO/unG36xEgvATup8eOTIZipmCr9wfOMd
 nhKBmkXUVzo67m500guUZxReP9hDRoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622431756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U8z9sFxuLmDrXKy+7RcdXv0FZ/Sza9pVfl9EEvwaRI8=;
 b=xi4h0lSa48Ts2UZskSqBNPNpgK4PNHrw7L7n5nMmzrWpDjIzxnrMAmyaLuhh/ULUTjxVCn
 b9PQYd2/PdZa6bCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id f912KgxYtGCQQQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 31 May 2021 03:29:16 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 31 May 2021 05:29:10 +0200
Message-Id: <20210531032910.6739-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Score: 1.00
X-Spamd-Result: default: False [1.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] doc: Drop uClinux support
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

U2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQpIaSwKCnNvbWUg
c2hvcnRlciBmb3JtIGNvdWxkIGJlIGFkZGVkIHRvIDMuIFRlc3QgQ29udHJpYnV0aW9uIENoZWNr
bGlzdCBbMV0gYXMgd2VsbC4KCktpbmQgcmVnYXJkcywKUGV0cgoKWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL3dpa2kvVGVzdC1Xcml0aW5nLUd1aWRlbGluZXMj
My10ZXN0LWNvbnRyaWJ1dGlvbi1jaGVja2xpc3QKCiBkb2MvbWFpbnRhaW5lci1wYXRjaC1yZXZp
ZXctY2hlY2tsaXN0LnR4dCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZG9jL21haW50YWluZXItcGF0Y2gtcmV2aWV3LWNoZWNrbGlzdC50eHQg
Yi9kb2MvbWFpbnRhaW5lci1wYXRjaC1yZXZpZXctY2hlY2tsaXN0LnR4dAppbmRleCA1NDIwZmE5
MzMuLjgxZWQ2MWRkZiAxMDA2NDQKLS0tIGEvZG9jL21haW50YWluZXItcGF0Y2gtcmV2aWV3LWNo
ZWNrbGlzdC50eHQKKysrIGIvZG9jL21haW50YWluZXItcGF0Y2gtcmV2aWV3LWNoZWNrbGlzdC50
eHQKQEAgLTQ0LDYgKzQ0LDkgQEAgTmV3IHRlc3Qgc2hvdWxkCiAqIERvY3BhcnNlIGRvY3VtZW50
YXRpb24KICogSWYgYSB0ZXN0IGlzIGEgcmVncmVzc2lvbiB0ZXN0IGl0IHNob3VsZCBpbmNsdWRl
IHRhZ3MKICAgKG1vcmUgaW4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9s
dHAvd2lraS9UZXN0LVdyaXRpbmctR3VpZGVsaW5lcyMyMjM4LXRlc3QtdGFnc1tUZXN0IHRhZ3Nd
KQorKiBXaGVuIHJld3JpdHRpbmcgb2xkIHRlc3RzLCBodHRwczovL2VuLndpa2lwZWRpYS5vcmcv
d2lraS8lQ0UlOUNDbGludXhbdUNsaW51eAorICAozrxDbGludXgpXSBzdXBwb3J0IHNob3VsZCBi
ZSByZW1vdmVkIChwcm9qZWN0IGhhcyBiZWVuIGRpc2NvbnRpbnVlZCkuCisgIEUuZy4gYEZPUktf
T1JfVkZPUksoKWAgc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggc2ltcGxlIGBmb3JrKClgIG9yIGBT
QUZFX0ZPUksoKWAuCiAKICMjIyBTaGVsbCB0ZXN0cwogKiBVc2UgbmV3IGh0dHBzOi8vZ2l0aHVi
LmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL3dpa2kvVGVzdC1Xcml0aW5nLUd1aWRlbGluZXMj
MjMtd3JpdGluZy1hLXRlc3RjYXNlLWluLXNoZWxsW3NoZWxsIEFQSV0KLS0gCjIuMzEuMQoKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
