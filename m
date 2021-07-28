Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 733613D8DF1
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 14:35:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA7E03C90EE
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 14:35:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0CFC33C641F
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 14:34:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B12B2600F4B
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 14:34:25 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 65B8D201A2;
 Wed, 28 Jul 2021 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627475665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wlo3EwMihenbLS05yRwYT95Zi3vpovMNIxMDELxOY78=;
 b=iC9E5HaNluHn9OAANrejHqj3e8nUqyR2pdR+ZLFsLtwOWXWdrFQwZ7aG/Iq43YPNBfMLi+
 a0SRkKnOYlRnhNqHVRaTE2flx6J6bjQ2LcmdeZouxA5r01kaE5F0ED8PqDIhvaKH7BJV7q
 yEE6P1OTCr0hQQ8QXX8eTR2EBwz2Dd4=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 362E1A3B81;
 Wed, 28 Jul 2021 12:34:25 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 28 Jul 2021 13:34:12 +0100
Message-Id: <20210728123412.31858-9-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728123412.31858-1-rpalethorpe@suse.com>
References: <20210728123412.31858-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 8/8] API/tst_tsc: Add guards and remove some
 boilerplate
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

U2lnbmVkLW9mZi1ieTogUmljaGFyZCBQYWxldGhvcnBlIDxycGFsZXRob3JwZUBzdXNlLmNvbT4K
LS0tCiBpbmNsdWRlL3RzdF90c2MuaCB8IDM1ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3RzdF90c2MuaCBiL2luY2x1ZGUvdHN0X3RzYy5oCmluZGV4
IDlhZDVmZDY1OS4uM2Y0OWE2Y2E3IDEwMDY0NAotLS0gYS9pbmNsdWRlL3RzdF90c2MuaAorKysg
Yi9pbmNsdWRlL3RzdF90c2MuaApAQCAtMSwyOCArMSw2IEBACi0vKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCi0gKgotICogICBDb3B5cmlnaHQgwqkgSW50ZXJuYXRpb25hbCBCdXNpbmVzcyBNYWNoaW5l
cyAgQ29ycC4sIDIwMDYtMjAwOAotICoKLSAqICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdh
cmU7ICB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0gKiAgIGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVk
IGJ5Ci0gKiAgIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIg
b2YgdGhlIExpY2Vuc2UsIG9yCi0gKiAgIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNp
b24uCi0gKgotICogICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhh
dCBpdCB3aWxsIGJlIHVzZWZ1bCwKLSAqICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyAgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCi0gKiAgIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZQotICogICB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLSAqCi0gKiAgIFlvdSBzaG91
bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
Ci0gKiAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyAgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJl
ZSBTb2Z0d2FyZQotICogICBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZp
ZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBCi0gKgotICogTkFNRQotICogICAg
ICAgbGlidHNjLmgKLSAqCi0gKiBERVNDUklQVElPTgotICoKLSAqIFVTQUdFOgotICogICAgICAg
VG8gYmUgaW5jbHVkZWQgaW4gc29tZSB0ZXN0Y2FzZXMuCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vci1sYXRlcgorLyoKKyAqIENvcHlyaWdodCDCqSBJbnRlcm5hdGlvbmFs
IEJ1c2luZXNzIE1hY2hpbmVzICBDb3JwLiwgMjAwNi0yMDA4CiAgKgogICogQVVUSE9SCiAgKiAg
ICAgICAgRGFycmVuIEhhcnQgPGR2aGx0Y0B1cy5pYm0uY29tPgpAQCAtMzAsOCArOCwxMCBAQAog
ICoKICAqIEhJU1RPUlkKICAqICAgICAgSXQgZGlyZWN0bHkgY29tZXMgZnJvbSB0aGUgbGlicnR0
ZXN0LmggKHNlZSBpdHMgSElTVE9SWSkuCi0gKgotICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLworICov
CisKKyNpZm5kZWYgVFNUX1RTQ19ICisjZGVmaW5lIFRTVF9UU0NfSAogCiAjdW5kZWYgVFNDX1VO
U1VQUE9SVEVECiAKQEAgLTcwLDMgKzUwLDQgQEAKICNkZWZpbmUgVFNDX1VOU1VQUE9SVEVECiAj
ZW5kaWYKIAorI2VuZGlmCi0tIAoyLjMxLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
