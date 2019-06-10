Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 164093B2C9
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 12:13:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF37C3EB04E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 12:13:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EB5203EA25F
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 12:13:48 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 070B9140024F
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 12:13:47 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id s24so3455431plr.8
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=lFCxn6a2apwjnPwZl1Cq0YDIa2gjD/OoZSxSNyeP70k=;
 b=oHWM2zGTeNbAojX09kfm+4mC6Ijj6ak9Le/1ON4AEq0J6RaBHP39tkYQswR0v3KIgc
 vdOsKumVuD/mspuxPQk5nnsUu0Kigh04KDH3iBn5wQYjfATZvfWBvqntjCkjC3GwCAa4
 8k3D9wTcibYmzZWK6dTeVnGZuKD4FOssj5hKy82mhj8xriJZ3Q3tE8uxnMgthnNC/wwq
 FIDvJ6RVdbIfYLjgGB6zYNxMVrMp7Iml19UDlOnctfE1H80LYVlQ5TdxjZ6tDEt+LoLo
 t2NdafHXZhrCajlWvAO36eJq0HHoHj4t0gYKvPE7xcoYnNvpmdiAGKZI5+SoFurYPCiB
 QPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lFCxn6a2apwjnPwZl1Cq0YDIa2gjD/OoZSxSNyeP70k=;
 b=R2d6my9jMOuWwySEIUJ3Nrz6/p/QRkCC46av2pxZCWBvpWpyzBG2xpavSokD0HWG7m
 qrPEsnFm/oLtzs3Uy3YzBBF1n7Y+LGCYK6L9DJB/3AFkPPk35vfWKZcJnAA4gkNAtsvT
 U+TLh64KADLBLObKqlbLquuQZhNXIuHRQcu4ALXXdqHBrZi7MqB5ynetUpnKiOgFhmcc
 5yUtSpiWfz2RChlOzwlH4q0O6ED+KRmgzzhC3b4nC6KO8umE6eEELFeRO6+XF2pESQr1
 MSFa8+o5K0bixe5We1Zz7fWETgCUW3P8lROeyQyldowQJl4vLo6yXqbMvNRZzTePl72w
 LRsw==
X-Gm-Message-State: APjAAAWbb4eS5acysQ2zVvvQVvUzT6f2Jb7rMdId+ljolXUIZHHXyJX/
 U6vUuthekvP19qslnbcz5/mt5w==
X-Google-Smtp-Source: APXvYqzLV5VTSJAvhGWsS3i/64xyjBNblrP+UziO+dM+cR0I0W4LRjuvzQ0zaDCcikdJ+LcS9I1XdQ==
X-Received: by 2002:a17:902:290b:: with SMTP id
 g11mr68609518plb.26.1560161626378; 
 Mon, 10 Jun 2019 03:13:46 -0700 (PDT)
Received: from localhost.localdomain ([117.196.234.139])
 by smtp.gmail.com with ESMTPSA id q1sm16754047pfb.156.2019.06.10.03.13.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Jun 2019 03:13:45 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: chrubis@suse.cz,
	liwang@redhat.com
Date: Mon, 10 Jun 2019 15:43:16 +0530
Message-Id: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file sync
	test-cases
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

QWRkIHBhcnRpYWwgZmlsZSBzeW5jIHRlc3RzIGFzIHBhcnQgb2Ygc3luY19maWxlX3JhbmdlMDIg
dGVzdC1jYXNlLgoKU2lnbmVkLW9mZi1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8u
b3JnPgotLS0KCkNoYW5nZXMgaW4gdjQ6CnZmYXQgRlMgZG9lc24ndCBzdXBwb3J0IHNwYXJzZSBm
aWxlcy4gU28gaGFuZGxlIHRoaXMgdmlhIHByZS1maWxsaW5nIHRoZQp0ZXN0IGZpbGUgaW4gY2Fz
ZSBvZiAidGVzdDMiLgoKQ2hhbmdlcyBpbiB2MzoKMS4gQWRkIHVwcGVyIGJvdW5kIGNoZWNrIGZv
ciBzeW5jZWQgc2l6ZSB0byBkZXZpY2UuCjIuIFJlZmFjdG9yIHRlc3RzIGZvciBtb3JlIGNvZGUg
cmV1c2UuCjMuIEFkZCBhbm90aGVyIHRlc3QgdG8gY2hlY2sgc3luYyBvdmVyIHBhcnRpYWwgd3Jp
dGUuCgpDaGFuZ2VzIGluIHYyOgoxLiBEbyBmdWxsIGZpbGUgd3JpdGUgaW5zdGVhZCBvZiBwYXJ0
aWFsIGFuZCB0ZXN0IHN5bmMgcGFydGlhbCBmaWxlLgoKIC4uLi9zeXNjYWxscy9zeW5jX2ZpbGVf
cmFuZ2Uvc3luY19maWxlX3JhbmdlMDIuYyAgIHwgNTMgKysrKysrKysrKysrKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3luY19maWxlX3JhbmdlL3N5bmNfZmls
ZV9yYW5nZTAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N5bmNfZmlsZV9yYW5nZS9z
eW5jX2ZpbGVfcmFuZ2UwMi5jCmluZGV4IDgyZDc3ZjcuLjk0NTRhNTYgMTAwNjQ0Ci0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3luY19maWxlX3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAy
LmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zeW5jX2ZpbGVfcmFuZ2Uvc3luY19m
aWxlX3JhbmdlMDIuYwpAQCAtMjIsMjMgKzIyLDM2IEBACiAjaW5jbHVkZSAiY2hlY2tfc3luY19m
aWxlX3JhbmdlLmgiCiAKICNkZWZpbmUgTU5UUE9JTlQJCSJtbnRfcG9pbnQiCi0jZGVmaW5lIEZO
QU1FCQlNTlRQT0lOVCIvdGVzdCIKLSNkZWZpbmUgRklMRV9TSVpFX01CCTMyCi0jZGVmaW5lIEZJ
TEVfU0laRSAoRklMRV9TSVpFX01CICogVFNUX01CKQorI2RlZmluZSBGTkFNRTEJCQlNTlRQT0lO
VCIvdGVzdDEiCisjZGVmaW5lIEZOQU1FMgkJCU1OVFBPSU5UIi90ZXN0MiIKKyNkZWZpbmUgRk5B
TUUzCQkJTU5UUE9JTlQiL3Rlc3QzIgorI2RlZmluZSBGSUxFX1NaX01CCQkzMgorI2RlZmluZSBG
SUxFX1NaCQkJKEZJTEVfU1pfTUIgKiBUU1RfTUIpCiAjZGVmaW5lIE1PREUJCQkwNjQ0CiAKLXN0
YXRpYyB2b2lkIHZlcmlmeV9zeW5jX2ZpbGVfcmFuZ2Uodm9pZCkKK3N0cnVjdCB0ZXN0Y2FzZSB7
CisJY2hhciAqZm5hbWU7CisJb2ZmNjRfdCBzeW5jX29mZjsKKwlvZmY2NF90IHN5bmNfc2l6ZTsK
KwlzaXplX3QgZXhwX3N5bmNfc2l6ZTsKKwlvZmY2NF90IHdyaXRlX29mZjsKKwlzaXplX3Qgd3Jp
dGVfc2l6ZV9tYjsKK307CisKK3N0YXRpYyB2b2lkIHZlcmlmeV9zeW5jX2ZpbGVfcmFuZ2Uoc3Ry
dWN0IHRlc3RjYXNlICp0YykKIHsKIAlpbnQgZmQ7CiAJdW5zaWduZWQgbG9uZyB3cml0dGVuOwog
Ci0JZmQgPSBTQUZFX09QRU4oRk5BTUUsIE9fUkRXUnxPX0NSRUFULCBNT0RFKTsKKwlmZCA9IFNB
RkVfT1BFTih0Yy0+Zm5hbWUsIE9fUkRXUnxPX0NSRUFULCBNT0RFKTsKKworCWxzZWVrKGZkLCB0
Yy0+d3JpdGVfb2ZmLCBTRUVLX1NFVCk7CiAKIAl0c3RfZGV2X2J5dGVzX3dyaXR0ZW4odHN0X2Rl
dmljZS0+ZGV2KTsKIAotCXRzdF9maWxsX2ZkKGZkLCAwLCBUU1RfTUIsIEZJTEVfU0laRV9NQik7
CisJdHN0X2ZpbGxfZmQoZmQsIDAsIFRTVF9NQiwgdGMtPndyaXRlX3NpemVfbWIpOwogCi0JVEVT
VChzeW5jX2ZpbGVfcmFuZ2UoZmQsIDAsIEZJTEVfU0laRSwKKwlURVNUKHN5bmNfZmlsZV9yYW5n
ZShmZCwgdGMtPnN5bmNfb2ZmLCB0Yy0+c3luY19zaXplLAogCQkJICAgICBTWU5DX0ZJTEVfUkFO
R0VfV0FJVF9CRUZPUkUgfAogCQkJICAgICBTWU5DX0ZJTEVfUkFOR0VfV1JJVEUgfAogCQkJICAg
ICBTWU5DX0ZJTEVfUkFOR0VfV0FJVF9BRlRFUikpOwpAQCAtNTAsMjMgKzYzLDQzIEBAIHN0YXRp
YyB2b2lkIHZlcmlmeV9zeW5jX2ZpbGVfcmFuZ2Uodm9pZCkKIAogCVNBRkVfQ0xPU0UoZmQpOwog
Ci0JaWYgKHdyaXR0ZW4gPj0gRklMRV9TSVpFKQorCWlmICgod3JpdHRlbiA+PSB0Yy0+ZXhwX3N5
bmNfc2l6ZSkgJiYKKwkgICAgKHdyaXR0ZW4gPD0gKHRjLT5leHBfc3luY19zaXplICsgdGMtPmV4
cF9zeW5jX3NpemUvMTApKSkKIAkJdHN0X3JlcyhUUEFTUywgIlRlc3QgZmlsZSByYW5nZSBzeW5j
ZWQgdG8gZGV2aWNlIik7CiAJZWxzZQotCQl0c3RfcmVzKFRGQUlMLCAiU3luY2VkICVsaSwgZXhw
ZWN0ZWQgJWkiLCB3cml0dGVuLCBGSUxFX1NJWkUpOworCQl0c3RfcmVzKFRGQUlMLCAiU3luY2Vk
ICVsaSwgZXhwZWN0ZWQgJWxpIiwgd3JpdHRlbiwKKwkJCXRjLT5leHBfc3luY19zaXplKTsKK30K
Kworc3RhdGljIHN0cnVjdCB0ZXN0Y2FzZSB0ZXN0Y2FzZXNbXSA9IHsKKwl7IEZOQU1FMSwgMCwg
RklMRV9TWiwgRklMRV9TWiwgMCwgRklMRV9TWl9NQiB9LAorCXsgRk5BTUUyLCBGSUxFX1NaLzQs
IEZJTEVfU1ovMiwgRklMRV9TWi8yLCAwLCBGSUxFX1NaX01CIH0sCisJeyBGTkFNRTMsIEZJTEVf
U1ovNCwgRklMRV9TWi8yLCBGSUxFX1NaLzQsIEZJTEVfU1ovMiwgRklMRV9TWl9NQi80IH0sCit9
OworCitzdGF0aWMgdm9pZCBydW4odW5zaWduZWQgaW50IGkpCit7CisJdmVyaWZ5X3N5bmNfZmls
ZV9yYW5nZSgmdGVzdGNhc2VzW2ldKTsKIH0KIAogc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIHsK
IAlpZiAoIWNoZWNrX3N5bmNfZmlsZV9yYW5nZSgpKQogCQl0c3RfYnJrKFRDT05GLCAic3luY19m
aWxlX3JhbmdlKCkgbm90IHN1cHBvcnRlZCIpOworCisJaWYgKCFzdHJjbXAodHN0X2RldmljZS0+
ZnNfdHlwZSwgInZmYXQiKSkgeworCQl0c3RfcmVzKFRJTkZPLCAiUHJlLWZpbGxpbmcgZmlsZSIp
OworCQl0c3RfZmlsbF9maWxlKEZOQU1FMywgMCwgVFNUX01CLCBGSUxFX1NaX01CKTsKKwkJc3lu
YygpOworCX0KIH0KIAogc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0geworCS50Y250ID0g
QVJSQVlfU0laRSh0ZXN0Y2FzZXMpLAogCS5uZWVkc19yb290ID0gMSwKIAkubW91bnRfZGV2aWNl
ID0gMSwKIAkuYWxsX2ZpbGVzeXN0ZW1zID0gMSwKIAkubW50cG9pbnQgPSBNTlRQT0lOVCwKIAku
c2V0dXAgPSBzZXR1cCwKLQkudGVzdF9hbGwgPSB2ZXJpZnlfc3luY19maWxlX3JhbmdlLAorCS50
ZXN0ID0gcnVuLAogfTsKLS0gCjIuNy40CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
