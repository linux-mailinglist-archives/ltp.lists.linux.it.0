Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA5C231ED4
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 14:55:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9A9C3C266E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 14:55:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8B4903C1CB2
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 14:55:44 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9F0681A01170
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 14:55:43 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id k4so11746771pld.12
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fpT/teL+RpZc3aK9SOL0O1T9ju2fFXUj4P53wCNi9ZQ=;
 b=d1nNDWM7hrjxnbymk3jFsWjx7kqKXLiIkK4PoFFn/u8i0zSm1p9eYZcVjHVJea6waG
 ULdTpJwjt/lYNfACtWRVWjb0pyP0NNsIsCPXHrPI2VuOIQ8XhuYsSwjsBcsfEZmlZAaS
 YLF9H9k5HJnbcK3aArsfrj0fC53WYaLGAXqT2gKj76lkVjDoBtt8EWdBrdoJ9dKbt+E3
 Ytquf6ZmNfn0HKuYwffqGT6s3oib5lS6caW14ZK3iycs6xCBZjt4hUIOnP2+rmj+EqfF
 5zPfprN1q7HC34tPPoB0KNKKw4+9AbA7P54gabscDCZutsZ2YIyvJvdVOH0Cz/Qf/EXV
 p1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fpT/teL+RpZc3aK9SOL0O1T9ju2fFXUj4P53wCNi9ZQ=;
 b=ErB9TIqQ/QtcJV0Wes1Jiw4w504knD3WIkFJyQaiKkOKk4XOgonh91jLBVrnEPf0n5
 09EvwRUN6mzbfZtnZZFiSCJPwiAKaf4t812ghBFNaa6vMvD4749hl6r61wKorEAmMBUS
 kh4Qqax7/GpZADd+TYhVkiAaCg7UPxf8WchMr0jvKloeQWdvscFnVlBjgr+13Wlfz+Cz
 sIONrPJBnSZb6bpT32P5bgVJepKeWeV0JzA7JgHViqPhOrmxdYRSe0wcK34N96XP0Fc5
 SdBJdat5XSHJ7itRSkw56YYxILMIUFzg/3OZjVBfV6bzatSYOzFXi3l3gb544ITk82Cu
 rFiQ==
X-Gm-Message-State: AOAM5306RoEIOg7qWgfhrKyn6i9cT1TwDw+3l83d1hrLKc/6MI7E1Gfc
 h7aESJk+zRN0wWNWhfSyDPllYhhQXEQ=
X-Google-Smtp-Source: ABdhPJz30CoaXzI71ntZSWD6S1IL4XsJx+yyadqISaSJrwW1FjMcm9kQGeWrpCMo2qgJZ8vI67lKoQ==
X-Received: by 2002:a17:902:8349:: with SMTP id
 z9mr28347898pln.46.1596027341778; 
 Wed, 29 Jul 2020 05:55:41 -0700 (PDT)
Received: from localhost ([182.68.37.99])
 by smtp.gmail.com with ESMTPSA id d128sm2315950pfa.24.2020.07.29.05.55.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 05:55:40 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 29 Jul 2020 18:25:36 +0530
Message-Id: <82754cb787a5af12d61fb71364d40909d5503204.1596027282.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
References: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V3 1/2] libs: sigwait: Fix compilation warning around
 sigprocmask()
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

TmV3ZXIgZ2NjIGdlbmVyYXRlcyBmb2xsb3dpbmcgd2FybmluZ3MgY3VycmVudGx5OgoKc2lnd2Fp
dC5jOiBJbiBmdW5jdGlvbiDigJh0ZXN0X21hc2tlZF9tYXRjaGluZ+KAmToKc2lnd2FpdC5jOjE1
Nzo0Mjogd2FybmluZzogcGFzc2luZyBhcmd1bWVudCAzIHRvIHJlc3RyaWN0LXF1YWxpZmllZCBw
YXJhbWV0ZXIgYWxpYXNlcyB3aXRoIGFyZ3VtZW50IDIgWy1XcmVzdHJpY3RdCiAgMTU3IHwgIFRF
U1Qoc2lncHJvY21hc2soU0lHX1NFVE1BU0ssICZvbGRtYXNrLCAmb2xkbWFzaykpOwoKRml4IHRo
ZXNlIGJ5IHJlcGxhY2luZyB0aGUgdGhpcmQgYXJndW1lbnQgd2l0aCBzaWdzIG9yIHJlbW92aW5n
IGl0IGlmCm5vdCByZXF1aXJlZC4KCkFsc28gaW1wcm92ZSBhIGNvbW1lbnQgd2hpbGUgYXQgaXQu
CgpSZXBvcnRlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+ClNpZ25lZC1vZmYtYnk6
IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Ci0tLQpWMzoKLSBGaXggZnVu
Y3Rpb24gYXJndW1lbnRzLgotIEZpeCBwcmludCBtZXNzYWdlLgoKIGxpYnMvbGlibHRwc2lnd2Fp
dC9zaWd3YWl0LmMgfCAxNiArKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYnMvbGlibHRwc2lnd2Fp
dC9zaWd3YWl0LmMgYi9saWJzL2xpYmx0cHNpZ3dhaXQvc2lnd2FpdC5jCmluZGV4IGRiZDMzYTYx
ZjJiMS4uZmQzMmVmZDhhYTlmIDEwMDY0NAotLS0gYS9saWJzL2xpYmx0cHNpZ3dhaXQvc2lnd2Fp
dC5jCisrKyBiL2xpYnMvbGlibHRwc2lnd2FpdC9zaWd3YWl0LmMKQEAgLTE1NiwxMSArMTU2LDEx
IEBAIHZvaWQgdGVzdF9tYXNrZWRfbWF0Y2hpbmcoc3dpX2Z1bmMgc2lnd2FpdGluZm8sIGludCBz
aWdubywKIAkJCSAgICAmJiBzaS5zaV9jb2RlID09IFNJX1VTRVIKIAkJCSAgICAmJiBzaS5zaV9z
aWdubyA9PSBzaWdubywgIlN0cnVjdCBzaWdpbmZvIG1pc21hdGNoIik7CiAKLQlURVNUKHNpZ3By
b2NtYXNrKFNJR19TRVRNQVNLLCAmb2xkbWFzaywgJm9sZG1hc2spKTsKKwlURVNUKHNpZ3Byb2Nt
YXNrKFNJR19TRVRNQVNLLCAmb2xkbWFzaywgJnNpZ3MpKTsKIAlpZiAoVFNUX1JFVCA9PSAtMSkK
IAkJdHN0X2JyayhUQlJPSyB8IFRURVJSTk8sICJyZXN0b3Jpbmcgb3JpZ2luYWwgc2lnbmFsIG1h
c2sgZmFpbGVkIik7CiAKLQlpZiAoc2lnaXNtZW1iZXIoJm9sZG1hc2ssIHNpZ25vKSkKKwlpZiAo
c2lnaXNtZW1iZXIoJnNpZ3MsIHNpZ25vKSkKIAkJdHN0X3JlcyhUUEFTUywgInNpZ3dhaXRpbmZv
IHJlc3RvcmVkIHRoZSBvcmlnaW5hbCBtYXNrIik7CiAJZWxzZQogCQl0c3RfcmVzKFRGQUlMLApA
QCAtMjE0LDExICsyMTQsMTEgQEAgdm9pZCB0ZXN0X21hc2tlZF9tYXRjaGluZ19ydChzd2lfZnVu
YyBzaWd3YWl0aW5mbywgaW50IHNpZ25vLAogCQkJICAgICYmIHNpLnNpX3NpZ25vID09IHNpZ25v
ICsgMSwKIAkJCSAgICAiU3RydWN0IHNpZ2luZm8gbWlzbWF0Y2giKTsKIAotCVRFU1Qoc2lncHJv
Y21hc2soU0lHX1NFVE1BU0ssICZvbGRtYXNrLCAmb2xkbWFzaykpOworCVRFU1Qoc2lncHJvY21h
c2soU0lHX1NFVE1BU0ssICZvbGRtYXNrLCAmc2lncykpOwogCWlmIChUU1RfUkVUID09IC0xKQog
CQl0c3RfYnJrKFRCUk9LIHwgVFRFUlJOTywgInJlc3RvcmluZyBvcmlnaW5hbCBzaWduYWwgbWFz
ayBmYWlsZWQiKTsKIAotCWlmIChzaWdpc21lbWJlcigmb2xkbWFzaywgc2lnbm8pKQorCWlmIChz
aWdpc21lbWJlcigmc2lncywgc2lnbm8pKQogCQl0c3RfcmVzKFRQQVNTLCAic2lnd2FpdGluZm8g
cmVzdG9yZWQgdGhlIG9yaWdpbmFsIG1hc2siKTsKIAllbHNlCiAJCXRzdF9yZXMoVEZBSUwsCkBA
IC0yNTAsMTEgKzI1MCwxMSBAQCB2b2lkIHRlc3RfbWFza2VkX21hdGNoaW5nX25vaW5mbyhzd2lf
ZnVuYyBzaWd3YWl0aW5mbywgaW50IHNpZ25vLAogCVRFU1Qoc2lnd2FpdGluZm8oJnNpZ3MsIE5V
TEwsIE5VTEwpKTsKIAlSRVBPUlRfU1VDQ0VTUyhzaWdubywgMCk7CiAKLQlURVNUKHNpZ3Byb2Nt
YXNrKFNJR19TRVRNQVNLLCAmb2xkbWFzaywgJm9sZG1hc2spKTsKKwlURVNUKHNpZ3Byb2NtYXNr
KFNJR19TRVRNQVNLLCAmb2xkbWFzaywgJnNpZ3MpKTsKIAlpZiAoVFNUX1JFVCA9PSAtMSkKIAkJ
dHN0X2JyayhUQlJPSyB8IFRURVJSTk8sICJyZXN0b3Jpbmcgb3JpZ2luYWwgc2lnbmFsIG1hc2sg
ZmFpbGVkIik7CiAKLQlpZiAoc2lnaXNtZW1iZXIoJm9sZG1hc2ssIHNpZ25vKSkKKwlpZiAoc2ln
aXNtZW1iZXIoJnNpZ3MsIHNpZ25vKSkKIAkJdHN0X3JlcyhUUEFTUywgInNpZ3dhaXRpbmZvIHJl
c3RvcmVkIHRoZSBvcmlnaW5hbCBtYXNrIik7CiAJZWxzZQogCQl0c3RfcmVzKFRGQUlMLApAQCAt
Mjg5LDkgKzI4OSw5IEBAIHZvaWQgdGVzdF9iYWRfYWRkcmVzcyhzd2lfZnVuYyBzaWd3YWl0aW5m
bywgaW50IHNpZ25vLAogCVRFU1Qoc2lnd2FpdGluZm8oJnNpZ3MsICh2b2lkICopMSwgTlVMTCkp
OwogCVJFUE9SVF9TVUNDRVNTKC0xLCBFRkFVTFQpOwogCi0JVEVTVChzaWdwcm9jbWFzayhTSUdf
U0VUTUFTSywgJm9sZG1hc2ssICZvbGRtYXNrKSk7CisJVEVTVChzaWdwcm9jbWFzayhTSUdfU0VU
TUFTSywgJm9sZG1hc2ssIE5VTEwpKTsKIAlpZiAoVFNUX1JFVCA9PSAtMSkKLQkJdHN0X2JyayhU
QlJPSyB8IFRURVJSTk8sICJzaWdwcm9jbWFzaygpIGZhaWxlZCIpOworCQl0c3RfYnJrKFRCUk9L
IHwgVFRFUlJOTywgInJlc3RvcmluZyBvcmlnaW5hbCBzaWduYWwgbWFzayBmYWlsZWQiKTsKIAog
CVNBRkVfS0lMTChjaGlsZCwgU0lHVEVSTSk7CiAJU0FGRV9XQUlUKE5VTEwpOwotLSAKMi4xNC4x
CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=
