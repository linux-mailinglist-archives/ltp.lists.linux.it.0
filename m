Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E18EF243
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 01:53:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 380413C24E1
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 01:53:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 229F83C1CA4
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 01:53:56 +0100 (CET)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 582BA1000A36
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 01:53:56 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id 11so18859497wmk.0
 for <ltp@lists.linux.it>; Mon, 04 Nov 2019 16:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+h7lHCAqL5RiVauqyaQhFDTWUpZfS/EsiJJpG5IgSQQ=;
 b=r7RQur+rVoqMO+UZN2DPnVzuJsiip/fBOWVlDc4hGje1rFEivaJx31MWqwAe4dU1Xs
 oA0V0oNWQxpF4i0FC8t88RslFb0nkqeof82EL24DDHdBdsi1a8cw7X/vM8cLEhQrD9f9
 fr56I9qDS8oKLjz3QD6pqO4Sy05Fxe2AsxZCkonHSz203pta/c74fsnSQ3FY/TtIlvcS
 b2RLDn6GNrciNop76qy01M1OVt9elGhnKv9GKhpv5yb6ncmIiozWQ6kz7gAkxxvWlNhl
 rMhCV8rRTwoYX9Dk+RmPvbn5bIA40LSNWbYxipgmmc1dO3uHVGG7h+p77zoAfE3UiviC
 hhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+h7lHCAqL5RiVauqyaQhFDTWUpZfS/EsiJJpG5IgSQQ=;
 b=pPu/yNkWgDI1wOQTUQL2Iq+pmEzJqxTWCQfwZngB/sPJdLUTq1uZdobEaZU/d2zGt7
 99mfwB+09QlawRrfTF/tyiXr+ib08nVAdXw1xamMaIJPwRTMYxbTTujCXwr96VuAHnXh
 DDTw7KKw/PxNYFX4JGSzR/gbVELQhJaYs2oQKGuRz//iw89biEGJiNSxxqznTKiDnYXV
 +fUsOGMLb2xlRvrLzSnrp4puJMPAxcKy/Ur37nUlCRYwZu3X8tf9ekxvnSWJDjkmvdtP
 ovX1v/0/WloioEGJ6EsLnXIpRaHl6UqikgwgWpSq53O0RO1kyW/tBz2sRsa3z5VcmnLK
 HyOQ==
X-Gm-Message-State: APjAAAVTibsofMmqBqr5XSyDA7MC9y7e+JwK8OtlMU/2hzk3jRFTRuYm
 4zkez1T0Lbb/Qx2vQqxo7XX7PdGqX30=
X-Google-Smtp-Source: APXvYqzsltvY7GCRXiS7WAfDDuu6UlZQNyq0qj8UvI3xLF2yT6y1ZuFPj3ZW3JUIeLnrpeybTJlJYA==
X-Received: by 2002:a1c:64d6:: with SMTP id y205mr1462930wmb.136.1572915235623; 
 Mon, 04 Nov 2019 16:53:55 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id g69sm20002476wme.31.2019.11.04.16.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 16:53:55 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 01:53:40 +0100
Message-Id: <20191105005341.19033-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0.rc2
In-Reply-To: <20191105005341.19033-1-petr.vorel@gmail.com>
References: <20191105005341.19033-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] fanotify: Move __kernel_fsid_t definition to
 correct place
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

VGhpcyBmaXhlcyBlcnJvcnM6CgpmYW5vdGlmeS5oOjE0OTo1NTogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lIOKAmF9fa2VybmVsX2ZzaWRfdOKAmQogc3RhdGljIGlubGluZSB2b2lkIGZhbm90aWZ5
X2dldF9maWQoY29uc3QgY2hhciAqcGF0aCwgX19rZXJuZWxfZnNpZF90ICpmc2lkLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+CmZhbm90aWZ5MTMuYzo0NzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYX19r
ZXJuZWxfZnNpZF904oCZCiAgX19rZXJuZWxfZnNpZF90IGZzaWQ7CgpGaXhlczogYjhhZWJjODM1
ICgiZmFub3RpZnk6IEZpeCBtaXNzaW5nIF9fa2VybmVsX2ZzaWRfdCBkZWZpbml0aW9uIikKClNp
Z25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgotLS0KIHRlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkuaCB8IDIwICsrKysrKysrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3Rp
ZnkuaCBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkuaAppbmRl
eCA0MzVmMTAwZDguLjU2M2E0ZWI1YiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9mYW5vdGlmeS9mYW5vdGlmeS5oCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
ZmFub3RpZnkvZmFub3RpZnkuaApAQCAtMTE2LDYgKzExNiwxNSBAQCBzdHJ1Y3QgZmFub3RpZnlf
bWFya190eXBlIHsKIAljb25zdCBjaGFyICogbmFtZTsKIH07CiAKKyNpZmRlZiBIQVZFX05BTUVf
VE9fSEFORExFX0FUCisjaWZuZGVmIF9fa2VybmVsX2ZzaWRfdAordHlwZWRlZiBzdHJ1Y3Qgewor
CWludAl2YWxbMl07Cit9IGxhcGlfZnNpZF90OworI2RlZmluZSBfX2tlcm5lbF9mc2lkX3QgbGFw
aV9mc2lkX3QKKyNlbmRpZgorI2VuZGlmIC8qIEhBVkVfTkFNRV9UT19IQU5ETEVfQVQgKi8KKwog
I2lmbmRlZiBGQU5fUkVQT1JUX0ZJRAogI2RlZmluZSBGQU5fUkVQT1JUX0ZJRAkJMHgwMDAwMDIw
MAogCkBAIC0xMjYsMjAgKzEzNSwxMyBAQCBzdHJ1Y3QgZmFub3RpZnlfZXZlbnRfaW5mb19oZWFk
ZXIgewogfTsKIAogI2lmZGVmIEhBVkVfTkFNRV9UT19IQU5ETEVfQVQKLSNpZm5kZWYgX19rZXJu
ZWxfZnNpZF90Ci10eXBlZGVmIHN0cnVjdCB7Ci0JaW50CXZhbFsyXTsKLX0gbGFwaV9mc2lkX3Q7
Ci0jZGVmaW5lIF9fa2VybmVsX2ZzaWRfdCBsYXBpX2ZzaWRfdAotI2VuZGlmCi0KIHN0cnVjdCBm
YW5vdGlmeV9ldmVudF9pbmZvX2ZpZCB7CiAJc3RydWN0IGZhbm90aWZ5X2V2ZW50X2luZm9faGVh
ZGVyIGhkcjsKIAlfX2tlcm5lbF9mc2lkX3QgZnNpZDsKIAl1bnNpZ25lZCBjaGFyIGhhbmRsZVsw
XTsKIH07Ci0jZW5kaWYKLSNlbmRpZgorI2VuZGlmIC8qIEhBVkVfTkFNRV9UT19IQU5ETEVfQVQg
Ki8KKyNlbmRpZiAvKiAhIEZBTl9SRVBPUlRfRklEICovCiAKICNpZmRlZiBIQVZFX05BTUVfVE9f
SEFORExFX0FUCiAvKgotLSAKMi4yNC4wLnJjMgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
