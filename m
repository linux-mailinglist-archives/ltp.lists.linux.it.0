Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A54B908
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 14:47:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB5143EA8AC
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 14:47:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6D2BB3EA2E2
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 14:47:15 +0200 (CEST)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C6325200778
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 14:47:13 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id x4so3247930wrt.6
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3ilkcr2L43jNRqMhtDoBNSlv7JUT3BSXHz5MxgJHUKM=;
 b=YS1YgdveLJJgANOl654Lj/1R00iXlITLNAZMv3ycDdyikAeW6uypaJHsQtntfZXrfj
 wHg0WRgeZAyVs0CZdvw8Bgf3FV/z0vOmnnsguzCvbfQHhDWSasreIHlXbalnp86DusXN
 GgnGjNZwxxA2N4/5m2GR79+KKZAKE9vRrKfR1CxC3K3mlyZbrq7BTPF1YYrxxdxVQj4x
 QR+3gtvm0Tefeh1DBTkgEEuxZOKucPoranyMLvE7Fk8IULFRi0tzDBwGQht85fThqUH8
 yfxjUrOiVKn573QdH5wkObhwZLf5eWKbhrEZaEfEjDRyHvD4vos29qJZuJCpS7AHBXfx
 jdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3ilkcr2L43jNRqMhtDoBNSlv7JUT3BSXHz5MxgJHUKM=;
 b=FKiq8lH+myZId1yTJoCWXGw3WzkCpqJ6CNWjt4JVZkczU+ACVtPP13FiMuxDKAHeNw
 b13DzohYEoLNbHM8jIGAPS01dTrZZvEEstEbmrEfqL7sNZRgYx/IAPgTH+QgPePSPaSL
 684OQW5Q4c0sYnL7BryL43jexsKrmy5B93YkOebxc5OzYVZx0haY9GnUsvj2miDWLva+
 Uqn7L9aJbb68yahwequ4Cr3SmX1JPpv2MF/qz0GjHry2WUu8lldo4w/o/+Z00BsryXSO
 Y6ty7WOD4PJuM5yywacuymnrjb4PVSQp0bYhS201Y8WZGUyrIiVm81SGdPuA0Tl4CrHB
 B9RQ==
X-Gm-Message-State: APjAAAVe4LAnUuI/WUYTaZh3Sq2ISFmT7eq4ABlodiiJKd8elLAE7OlB
 qgVKouDEezUmdSo5I4JTcsx4vo8K
X-Google-Smtp-Source: APXvYqz9ymQjFL9AvVbthSZtYbqzUFGC75MsJ9IwnQYsnpjYdBEv+Vhm016Bwp6vVHDSEJ9VxCVyZw==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr74757908wrv.30.1560948433197; 
 Wed, 19 Jun 2019 05:47:13 -0700 (PDT)
Received: from amir-ThinkPad-T480.ctera.local
 (bzq-166-168-31-246.red.bezeqint.net. [31.168.166.246])
 by smtp.gmail.com with ESMTPSA id s7sm5345196wmc.2.2019.06.19.05.47.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 05:47:12 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 19 Jun 2019 15:47:07 +0300
Message-Id: <20190619124707.2981-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH] syscalls/getxattr05: skip userns test cases when not
	supported
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhlc2UgdGVzdCBjYXNlcyBhcmUgZmFpbGluZyB3aGVuIENPTkZJR19VU0VSX05TIGlzIG5vdCBk
ZWZpbmVkLgoKU2lnbmVkLW9mZi1ieTogQW1pciBHb2xkc3RlaW4gPGFtaXI3M2lsQGdtYWlsLmNv
bT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dldHhhdHRyMDUuYyB8
IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHhhdHRy
L2dldHhhdHRyMDUuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0eGF0dHIvZ2V0eGF0
dHIwNS5jCmluZGV4IDMxYjk4NWVlMC4uYzBkMzM5ZjI5IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2dldHhhdHRyL2dldHhhdHRyMDUuYworKysgYi90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2dldHhhdHRyL2dldHhhdHRyMDUuYwpAQCAtMzcsMTEgKzM3LDEzIEBACiAj
aWYgZGVmaW5lZChIQVZFX1NZU19YQVRUUl9IKSAmJiBkZWZpbmVkKEhBVkVfTElCQUNMKQogCiAj
ZGVmaW5lIFRFU1RfRklMRQkidGVzdGZpbGUiCisjZGVmaW5lIFNFTEZfVVNFUk5TCSIvcHJvYy9z
ZWxmL25zL3VzZXIiCiAjZGVmaW5lIE1BWF9VU0VSTlMJIi9wcm9jL3N5cy91c2VyL21heF91c2Vy
X25hbWVzcGFjZXMiCiAjZGVmaW5lIFVJRF9NQVAJIi9wcm9jL3NlbGYvdWlkX21hcCIKIAogc3Rh
dGljIGFjbF90IGFjbDsKIHN0YXRpYyBpbnQgb3JpZ19tYXhfdXNlcm5zID0gLTE7CitzdGF0aWMg
aW50IHVzZXJfbnNfc3VwcG9ydGVkID0gMTsKIAogc3RhdGljIHN0cnVjdCB0Y2FzZSB7CiAJLyog
MDogd2l0aG91dCB1c2VybnMsIDE6IHdpdGggdXNlcm5zICovCkBAIC0xMTAsNiArMTEyLDExIEBA
IHN0YXRpYyB2b2lkIGRvX2dldHhhdHRyKHVuc2lnbmVkIGludCBuKQogCXN0cnVjdCB0Y2FzZSAq
dGMgPSAmdGNhc2VzW25dOwogCXBpZF90IHBpZDsKIAorCWlmICh0Yy0+c2V0X3VzZXJucyAmJiAh
dXNlcl9uc19zdXBwb3J0ZWQpIHsKKwkJdHN0X3JlcyhUQ09ORiwgInVzZXIgbmFtZXNwYWNlIG5v
dCBhdmFpbGFibGUiKTsKKwkJcmV0dXJuOworCX0KKwogCXBpZCA9IFNBRkVfRk9SSygpOwogCWlm
ICghcGlkKSB7CiAJCWlmICh0Yy0+c2V0X3VzZXJucykKQEAgLTE0NCwxMCArMTUxLDEzIEBAIHN0
YXRpYyB2b2lkIHNldHVwKHZvaWQpCiAJLyogVGhlIGRlZmF1bHQgdmFsdWUgb2YgbWF4X3VzZXJf
bmFtZXNwYWNlcyBpcyBzZXQgdG8gMCBvbiBzb21lIGRpc3Ryb3MsCiAJICogV2UgbmVlZCB0byBj
aGFuZ2UgdGhlIGRlZmF1bHQgdmFsdWUgdG8gY2FsbCB1bnNoYXJlKCkuCiAJICovCi0JaWYgKCFh
Y2Nlc3MoTUFYX1VTRVJOUywgRl9PSykpIHsKKwlpZiAoYWNjZXNzKFNFTEZfVVNFUk5TLCBGX09L
KSAhPSAwKSB7CisJCXVzZXJfbnNfc3VwcG9ydGVkID0gMDsKKwl9IGVsc2UgaWYgKCFhY2Nlc3Mo
TUFYX1VTRVJOUywgRl9PSykpIHsKIAkJU0FGRV9GSUxFX1NDQU5GKE1BWF9VU0VSTlMsICIlZCIs
ICZvcmlnX21heF91c2VybnMpOwogCQlTQUZFX0ZJTEVfUFJJTlRGKE1BWF9VU0VSTlMsICIlZCIs
IDEwKTsKIAl9CisKIH0KIAogc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQotLSAKMi4xNy4xCgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
