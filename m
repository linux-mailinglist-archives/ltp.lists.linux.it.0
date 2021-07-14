Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 857063C7F27
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8C3D3C8745
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C9563C7569
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D7D9714010D0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:14 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8BE1520265;
 Wed, 14 Jul 2021 07:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626246734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wlo3EwMihenbLS05yRwYT95Zi3vpovMNIxMDELxOY78=;
 b=UPcgMIncJqZ1eEWrgcR9h+QADqjZXGc73ERnnpGLXQwkCml9dkR1vdU/iKm3ZXESaAvn7e
 TVbXyEDzwiwxUkmVyUDtrRRZ1OZIkDGFipimkOFPBK1+BZKnU2Jh45k2dgLXOCrXq5YW0m
 +Uo7XXZ96C7xVjp7fCu+VdwHuTQa75Q=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 26203A3B8F;
 Wed, 14 Jul 2021 07:12:14 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 08:11:58 +0100
Message-Id: <20210714071158.15868-9-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714071158.15868-1-rpalethorpe@suse.com>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 8/8] API/tst_tsc: Add guards and remove some
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
