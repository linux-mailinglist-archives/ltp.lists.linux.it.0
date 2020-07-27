Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2422E944
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 11:41:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B64E13C26BF
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 11:41:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C99353C089D
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 11:41:08 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1E06B2013FB
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 11:41:08 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id i92so1308159pje.0
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laLhQTYSl9GPgzsivaiG5g++WpbkBq60FGMWRJCpF48=;
 b=Prx7I+RetKD+CS1ZvWL3geBXrAEcIpDPZFIBs153lDBgqsSTxvKoPlZPnZB9uBuIFC
 PNtjwUIqdjq8dXhuc5bzBUk+0jG0xHNpKROd6q8qSJ30lObEm1sjv2ZVL8cKpfz0lwrg
 o8y7NKvXZN4geSWcf8MvlpKw0BgxNLk0B3chjXg6p0vIABV2z6837nD0E/IMcqIFa3Fs
 8EiR7T9VVp9JT+QjHM7PdPFfC4xk/7rAiMkpL9/fi3mga3kqjI73PiptcdN557VC5TpQ
 yEG/Kqf8SSiCSbsFcAhkvoDNoGLeoUdQaZhzKOLz2ELtV+K3MYXStfpmzfbMLDYaPN/+
 4oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=laLhQTYSl9GPgzsivaiG5g++WpbkBq60FGMWRJCpF48=;
 b=EAJ0S+g3C4N4HQE1KJnnffaztWIYiC48IC1wsg+QcZHkkB55Z/jVY5AAhap70ZQuh1
 R+qfjxW3jzAnWt9aNjPQg4pZ1tyI4/o+ZkEQ7oij5cK0xFprkWsHfbAtSWgGeK8z2ba7
 q4OwgqVoCcAmtbyoRJw5Y/4/KIL+GedgAZtKKdew1y4geATAqVdEpnhg3hod7wMj0YFl
 eYXnZEBdXLnBM0WKUTSKyOry7INYuSKNUKu9BkPRTynCr5Rn5RsCb28bNTGR57Lp+bva
 hvVTKU5PcFybDqaUcj3kYXiPGflHBDLd/sIg2uiYxRRW4L5ClGXrnEichDtzOGzM/tYN
 vLqQ==
X-Gm-Message-State: AOAM531xoyp+rAMQ8Ya10qkkKkHuTQoAUYCt2a9bbdxd8HWxYFK5tMjW
 ejCQf2/2AJSh1J1E5aoy9U+IAD05Q8M=
X-Google-Smtp-Source: ABdhPJwabHVPaJOordw8QP+jlscdquADY1kCDNE4sKnaStuD6nvntXAQCTDL5YEnMQN4CkAnZbwwKA==
X-Received: by 2002:a17:90b:124c:: with SMTP id
 gx12mr18736799pjb.191.1595842834308; 
 Mon, 27 Jul 2020 02:40:34 -0700 (PDT)
Received: from localhost ([223.190.9.130])
 by smtp.gmail.com with ESMTPSA id n14sm14596567pgd.78.2020.07.27.02.40.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 02:40:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 27 Jul 2020 15:10:25 +0530
Message-Id: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/2] libs: sigwait: Fix compilation warning around
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
ZXNlIGJ5IHVzaW5nIGRpZmZlcmVudCBwb2ludGVycyBmb3IgbmV3IGFuZCBvbGQgbWFza3MuCgpS
ZXBvcnRlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+ClNpZ25lZC1vZmYtYnk6IFZp
cmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Ci0tLQpWMjogTmV3IHBhdGNoCgog
bGlicy9saWJsdHBzaWd3YWl0L3NpZ3dhaXQuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xp
YnMvbGlibHRwc2lnd2FpdC9zaWd3YWl0LmMgYi9saWJzL2xpYmx0cHNpZ3dhaXQvc2lnd2FpdC5j
CmluZGV4IGRiZDMzYTYxZjJiMS4uMGEzNGU2Y2MzZGViIDEwMDY0NAotLS0gYS9saWJzL2xpYmx0
cHNpZ3dhaXQvc2lnd2FpdC5jCisrKyBiL2xpYnMvbGlibHRwc2lnd2FpdC9zaWd3YWl0LmMKQEAg
LTE1NiwxMSArMTU2LDExIEBAIHZvaWQgdGVzdF9tYXNrZWRfbWF0Y2hpbmcoc3dpX2Z1bmMgc2ln
d2FpdGluZm8sIGludCBzaWdubywKIAkJCSAgICAmJiBzaS5zaV9jb2RlID09IFNJX1VTRVIKIAkJ
CSAgICAmJiBzaS5zaV9zaWdubyA9PSBzaWdubywgIlN0cnVjdCBzaWdpbmZvIG1pc21hdGNoIik7
CiAKLQlURVNUKHNpZ3Byb2NtYXNrKFNJR19TRVRNQVNLLCAmb2xkbWFzaywgJm9sZG1hc2spKTsK
KwlURVNUKHNpZ3Byb2NtYXNrKFNJR19TRVRNQVNLLCAmc2lncywgJm9sZG1hc2spKTsKIAlpZiAo
VFNUX1JFVCA9PSAtMSkKIAkJdHN0X2JyayhUQlJPSyB8IFRURVJSTk8sICJyZXN0b3Jpbmcgb3Jp
Z2luYWwgc2lnbmFsIG1hc2sgZmFpbGVkIik7CiAKLQlpZiAoc2lnaXNtZW1iZXIoJm9sZG1hc2ss
IHNpZ25vKSkKKwlpZiAoc2lnaXNtZW1iZXIoJnNpZ3MsIHNpZ25vKSkKIAkJdHN0X3JlcyhUUEFT
UywgInNpZ3dhaXRpbmZvIHJlc3RvcmVkIHRoZSBvcmlnaW5hbCBtYXNrIik7CiAJZWxzZQogCQl0
c3RfcmVzKFRGQUlMLApAQCAtMjE0LDExICsyMTQsMTEgQEAgdm9pZCB0ZXN0X21hc2tlZF9tYXRj
aGluZ19ydChzd2lfZnVuYyBzaWd3YWl0aW5mbywgaW50IHNpZ25vLAogCQkJICAgICYmIHNpLnNp
X3NpZ25vID09IHNpZ25vICsgMSwKIAkJCSAgICAiU3RydWN0IHNpZ2luZm8gbWlzbWF0Y2giKTsK
IAotCVRFU1Qoc2lncHJvY21hc2soU0lHX1NFVE1BU0ssICZvbGRtYXNrLCAmb2xkbWFzaykpOwor
CVRFU1Qoc2lncHJvY21hc2soU0lHX1NFVE1BU0ssICZzaWdzLCAmb2xkbWFzaykpOwogCWlmIChU
U1RfUkVUID09IC0xKQogCQl0c3RfYnJrKFRCUk9LIHwgVFRFUlJOTywgInJlc3RvcmluZyBvcmln
aW5hbCBzaWduYWwgbWFzayBmYWlsZWQiKTsKIAotCWlmIChzaWdpc21lbWJlcigmb2xkbWFzaywg
c2lnbm8pKQorCWlmIChzaWdpc21lbWJlcigmc2lncywgc2lnbm8pKQogCQl0c3RfcmVzKFRQQVNT
LCAic2lnd2FpdGluZm8gcmVzdG9yZWQgdGhlIG9yaWdpbmFsIG1hc2siKTsKIAllbHNlCiAJCXRz
dF9yZXMoVEZBSUwsCkBAIC0yNTAsMTEgKzI1MCwxMSBAQCB2b2lkIHRlc3RfbWFza2VkX21hdGNo
aW5nX25vaW5mbyhzd2lfZnVuYyBzaWd3YWl0aW5mbywgaW50IHNpZ25vLAogCVRFU1Qoc2lnd2Fp
dGluZm8oJnNpZ3MsIE5VTEwsIE5VTEwpKTsKIAlSRVBPUlRfU1VDQ0VTUyhzaWdubywgMCk7CiAK
LQlURVNUKHNpZ3Byb2NtYXNrKFNJR19TRVRNQVNLLCAmb2xkbWFzaywgJm9sZG1hc2spKTsKKwlU
RVNUKHNpZ3Byb2NtYXNrKFNJR19TRVRNQVNLLCAmc2lncywgJm9sZG1hc2spKTsKIAlpZiAoVFNU
X1JFVCA9PSAtMSkKIAkJdHN0X2JyayhUQlJPSyB8IFRURVJSTk8sICJyZXN0b3Jpbmcgb3JpZ2lu
YWwgc2lnbmFsIG1hc2sgZmFpbGVkIik7CiAKLQlpZiAoc2lnaXNtZW1iZXIoJm9sZG1hc2ssIHNp
Z25vKSkKKwlpZiAoc2lnaXNtZW1iZXIoJnNpZ3MsIHNpZ25vKSkKIAkJdHN0X3JlcyhUUEFTUywg
InNpZ3dhaXRpbmZvIHJlc3RvcmVkIHRoZSBvcmlnaW5hbCBtYXNrIik7CiAJZWxzZQogCQl0c3Rf
cmVzKFRGQUlMLApAQCAtMjg5LDcgKzI4OSw3IEBAIHZvaWQgdGVzdF9iYWRfYWRkcmVzcyhzd2lf
ZnVuYyBzaWd3YWl0aW5mbywgaW50IHNpZ25vLAogCVRFU1Qoc2lnd2FpdGluZm8oJnNpZ3MsICh2
b2lkICopMSwgTlVMTCkpOwogCVJFUE9SVF9TVUNDRVNTKC0xLCBFRkFVTFQpOwogCi0JVEVTVChz
aWdwcm9jbWFzayhTSUdfU0VUTUFTSywgJm9sZG1hc2ssICZvbGRtYXNrKSk7CisJVEVTVChzaWdw
cm9jbWFzayhTSUdfU0VUTUFTSywgJnNpZ3MsICZvbGRtYXNrKSk7CiAJaWYgKFRTVF9SRVQgPT0g
LTEpCiAJCXRzdF9icmsoVEJST0sgfCBUVEVSUk5PLCAic2lncHJvY21hc2soKSBmYWlsZWQiKTsK
IAotLSAKMi4xNC4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
