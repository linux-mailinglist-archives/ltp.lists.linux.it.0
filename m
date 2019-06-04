Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5206434BAA
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 17:10:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1930D3EABA7
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 17:10:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9B4763EAA54
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 17:10:43 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ACB0160071D
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 17:10:45 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id d17so445424wmb.3
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cd0jL1l37AnAOITWAtpWiSM2eipoS5jrsZBNVNTYX+Y=;
 b=by4JaETlUxK8Sj9bFkvoi3uSw1FzFALFVuZ6ZhcaO1IaDAWVoYYXdcyqjV6oxKHydJ
 7oYR74yw8/jy3ZI/jmJM3esmrz4+Ga0s4cUX5oYA5hue8pN/KMo9/T+jIio075E7g/M0
 m0RaDsD+hverwxYkoNmaWfrKlNEGPIG7wRqY+gn/yfgzqvz8mGsnPnpg3sWofoj3f+dE
 KHwZxv8fIM0FufqVCztUJ1hDE6J91XHmSohxw2w99y9daSuJRwGHLGSjq9gXgzJdNrCF
 rjpy4SR/KJPMjcTmwjT2I6HaDEkkdNArJun+k4ttKMHRs4T4Rw/0+jDaoRsZl19xXRPc
 ZGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cd0jL1l37AnAOITWAtpWiSM2eipoS5jrsZBNVNTYX+Y=;
 b=rk7S19lK59ac+t92vh7+mIW2j1ZpUJcaBdgneX9RIPuJHZDkqE77+K9tbPmKx+gJ9Y
 Yl+VeyTD2ngaFhrJZ1EHe491RGzd6DbwtYsr3ddzCj9kOKScwooc19P55WQFRdQFf23z
 kTV5Wl5eKHF3IWkSfzZTDALfruFxot8bLXK+c42uoaAxf3iXUGoARiIEe1EZEH0OpT5D
 BDWvpwANU9fQZkjDZHQZBpJ1Yjd5Y388h44uDUCjeR/TvWvPwe4c1SefrDcoYIo5LzMB
 9VFTbAsb/DnYhJLmnbm3i4YViQ+uG+fIxWwGTdK0XB0Eotelee0efERZKqzUyyl+zkbd
 WRzg==
X-Gm-Message-State: APjAAAV8SPYi5pK+Be/VZ2hrRmfhUAD8HdnegtcOQtcsz9FOBq3pVqM1
 MA5EGAzQVw3ZEJc/v2wveF8=
X-Google-Smtp-Source: APXvYqzoS/F608X6NNxHUoRRU3U0zMg5YiNwbZPvcZGzR8gnpSKhAL2mhiJPhhiZAemkXoBv4RgvvQ==
X-Received: by 2002:a1c:f901:: with SMTP id x1mr6430198wmh.157.1559661042766; 
 Tue, 04 Jun 2019 08:10:42 -0700 (PDT)
Received: from localhost.localdomain (p548C66C4.dip0.t-ipconnect.de.
 [84.140.102.196])
 by smtp.gmail.com with ESMTPSA id l7sm9077326wmh.20.2019.06.04.08.10.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 08:10:42 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Tue,  4 Jun 2019 18:10:35 +0300
Message-Id: <20190604151035.6123-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604151035.6123-1-amir73il@gmail.com>
References: <20190604151035.6123-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org, ltp@lists.linux.it
Subject: [LTP] [PATCH v2 2/2] fanotify06: Close all file descriptors of read
	events
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

V2l0aCBvdmVybGF5ZnMgdGVzdCBjYXNlIG9uIGtlcm5lbCB2NC4xOSwgd2UgZ2V0IGV4dHJhIGV2
ZW50cy4KSWYgd2UgZG8gbm90IGNsb3NlIHRoZSBldmVudC0+ZmQgZmlsZSBkZXNjcmlwdHJvcyBv
ZiBhbGwgdGhlIGV2ZW50cwp0aGF0IHdlIHJlYWQsIG92ZXJsYXlmcyB3aWxsIGZhaWwgdG8gdW5t
b3VudCBhdCB0aGUgZW5kIG9mIHRoZSB0ZXN0CmFuZCB0ZXN0IHdpbGwgcmV0cnkgdW4tbW91bnRp
bmcgZm9yIGEgd2hpbGUuCgpTaWduZWQtb2ZmLWJ5OiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxA
Z21haWwuY29tPgotLS0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNi5j
ICAgICAgfCAxOCArKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9m
YW5vdGlmeS9mYW5vdGlmeTA2LmMKaW5kZXggZTA1M2RhMGU1Li4yNzNjMWYwYzQgMTAwNjQ0Ci0t
LSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNi5jCisrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNi5jCkBAIC0xNDgs
NiArMTQ4LDE3IEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9ldmVudChpbnQgZ3JvdXAsIHN0cnVjdCBm
YW5vdGlmeV9ldmVudF9tZXRhZGF0YSAqZXZlbnQpCiAJfQogfQogCisvKiBDbG9zZSBhbGwgZmls
ZSBkZXNjcmlwdG9ycyBvZiByZWFkIGV2ZW50cyAqLworc3RhdGljIHZvaWQgY2xvc2VfZXZlbnRz
X2ZkKHN0cnVjdCBmYW5vdGlmeV9ldmVudF9tZXRhZGF0YSAqZXZlbnQsIGludCBidWZsZW4pCit7
CisJd2hpbGUgKGJ1ZmxlbiA+PSAoaW50KUZBTl9FVkVOVF9NRVRBREFUQV9MRU4pIHsKKwkJaWYg
KGV2ZW50LT5mZCAhPSBGQU5fTk9GRCkKKwkJCVNBRkVfQ0xPU0UoZXZlbnQtPmZkKTsKKwkJYnVm
bGVuIC09IChpbnQpRkFOX0VWRU5UX01FVEFEQVRBX0xFTjsKKwkJZXZlbnQrKzsKKwl9Cit9CisK
IHZvaWQgdGVzdF9mYW5vdGlmeSh1bnNpZ25lZCBpbnQgbikKIHsKIAlpbnQgcmV0OwpAQCAtMTk4
LDE3ICsyMDksMTYgQEAgdm9pZCB0ZXN0X2Zhbm90aWZ5KHVuc2lnbmVkIGludCBuKQogCQl9IGVs
c2UgewogCQkJdmVyaWZ5X2V2ZW50KGksIGV2ZW50KTsKIAkJfQotCQlpZiAoZXZlbnQtPmZkICE9
IEZBTl9OT0ZEKQotCQkJU0FGRV9DTE9TRShldmVudC0+ZmQpOworCQljbG9zZV9ldmVudHNfZmQo
ZXZlbnQsIHJldCk7CiAJfQorCiAJZm9yIChwID0gMTsgcCA8IEZBTk9USUZZX1BSSU9SSVRJRVM7
IHArKykgewogCQlmb3IgKGkgPSAwOyBpIDwgR1JPVVBTX1BFUl9QUklPOyBpKyspIHsKIAkJCXJl
dCA9IHJlYWQoZmRfbm90aWZ5W3BdW2ldLCBldmVudF9idWYsIEVWRU5UX0JVRl9MRU4pOwogCQkJ
aWYgKHJldCA+IDApIHsKIAkJCQl0c3RfcmVzKFRGQUlMLCAiZ3JvdXAgJWQgZ290IGV2ZW50IiwK
IAkJCQkJcCpHUk9VUFNfUEVSX1BSSU8gKyBpKTsKLQkJCQlpZiAoZXZlbnQtPmZkICE9IEZBTl9O
T0ZEKQotCQkJCQlTQUZFX0NMT1NFKGV2ZW50LT5mZCk7CisJCQkJY2xvc2VfZXZlbnRzX2ZkKCh2
b2lkICopZXZlbnRfYnVmLCByZXQpOwogCQkJfSBlbHNlIGlmIChyZXQgPT0gMCkgewogCQkJCXRz
dF9icmsoVEJST0ssICJ6ZXJvIGxlbmd0aCAiCiAJCQkJCSJyZWFkIGZyb20gZmFub3RpZnkgZmQi
KTsKLS0gCjIuMTcuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
