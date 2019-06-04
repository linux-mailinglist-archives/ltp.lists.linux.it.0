Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC51C34BA9
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 17:10:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D3393EAB15
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 17:10:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 931893EAA54
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 17:10:42 +0200 (CEST)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 65432600710
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 17:10:44 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id f9so1509860wre.12
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CVe8GNIy/jQT2Xib23+VR1m07gUIdS0n/O8YMNvFuQU=;
 b=YV5RxoXXaXO3ffWGqNRG9787gKuJ4vqkGLKaBQSzDKk3614orRzvJXG9oE8mfj5zTa
 +mi6Pc5RtnhjUay9dHSScFM7FPwQ+1SFUUIJo/E1woWbb7ygGydVD1yCxpUVWbfxOpQY
 lYY4E8Ba1aPmqMeVFuyaPo/mKqWewpGAsVa1yqzwAkZKqHRWPfs4Juy2WIeSwfMniPt0
 jvwqwipqQ+Zl7EeZ11CLwOZZUuWlhtM9FvbblLEm7GbcM13Tz744A28F9/SmxDSHP84Q
 cI6atxgu2lEUgl+D5Ibu4r8w4FUDSro/sL3DYULBWYrJwprcYxPIl5Mkw3ekhvmtrfMj
 gtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CVe8GNIy/jQT2Xib23+VR1m07gUIdS0n/O8YMNvFuQU=;
 b=GQnnAK5Wb55RWqOzGcH39ofhAoIR1BxRklmC0kYtJvImoM31P2JVScyyUiwsCZsnXh
 SLZnh664vuCPQWUJCANfqxnXXMHq63+yD8Tv+6I330hj7h/wJkjrU55VK3JTtL7wWNGS
 cgQ8qe5IkMmfJUrDEiqPF0mVifjIhjAoNJ1drvpsjkkCygC36ql3SJ34ajANgCY9Z7tO
 XwTMmtpPiw1yY8ykgqsCygN7ro4yjz003BajMw5aTJeDqVBQaa3lj0Vx38Z3nE2Rqz1m
 j1AL+dQOF56PNHHt6gxJi6eDFoMQlXbMOQRsf8z10fPahEr1rB/KFU0kWZPpoZv9Po1q
 amfg==
X-Gm-Message-State: APjAAAWglp3udHNOTxmoJjFCmLFTNjx4t+yBH8HN4RX06DLbyumPHx/s
 B03zPUnlE9abbKPKaHh/60Q=
X-Google-Smtp-Source: APXvYqyQxF4n08JLQREYaGKaXOmoa21LoiTQNR4fiDJ1Li0myH8dw3ML6w7yb3PkmrU2GRg41Ey7vQ==
X-Received: by 2002:adf:c5c1:: with SMTP id v1mr3636700wrg.129.1559661041439; 
 Tue, 04 Jun 2019 08:10:41 -0700 (PDT)
Received: from localhost.localdomain (p548C66C4.dip0.t-ipconnect.de.
 [84.140.102.196])
 by smtp.gmail.com with ESMTPSA id l7sm9077326wmh.20.2019.06.04.08.10.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 08:10:40 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Tue,  4 Jun 2019 18:10:34 +0300
Message-Id: <20190604151035.6123-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org, ltp@lists.linux.it
Subject: [LTP] [PATCH v2 1/2] fanotify06: add a test case for overlayfs
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

VGhpcyB0ZXN0IGZhaWxzIG9uIG92ZXJsYXlmcyBzaW5jZSBrZXJuZWwgdjQuMTkuCkFkZGVkIGEg
dGVzdCBjYXNlIGZvciBvdmVybGF5ZnMgbW91bnQuCgpTaWduZWQtb2ZmLWJ5OiBBbWlyIEdvbGRz
dGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgotLS0KCkNoYW5nZXMgc2luY2UgdjE6Ci0gVXNlIG5l
dyBvdmVybGF5ZnMgbW91bnQgaGVscGVycwotIEFkZCBwYXRjaCB0byBmaXggRUJVU1kgZXJyb3Ig
b24gb3ZlcmxheWZzIHVtb3VudAoKIC4uLi9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3Rp
ZnkwNi5jICAgICB8IDYxICsrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MyBp
bnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MDYuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNi5jCmluZGV4IDZhMmUyNDk0Zi4uZTA1M2RhMGU1IDEw
MDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MDYu
YworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MDYuYwpA
QCAtMTUsNiArMTUsMTQgQEAKICAqICBEYXRlOiAgIFRodSBOb3YgMTMgMTU6MTk6MzMgMjAxNCAt
MDgwMAogICoKICAqICAgICAgZmFub3RpZnk6IGZpeCBub3RpZmljYXRpb24gb2YgZ3JvdXBzIHdp
dGggaW5vZGUgJiBtb3VudCBtYXJrcworICoKKyAqIFRoZSBvdmVybGF5ZnMgdGVzdCBjYXNlIGlz
IGEgcmVncmVzc2lvbiB0ZXN0IGZvcjoKKyAqCisgKiAgY29tbWl0IGQ5ODk5MDMwNThhODNlODUz
NmNjN2FhZGY5MjU2YTQ3ZDVjMTczZmUKKyAqICBBdXRob3I6IEFtaXIgR29sZHN0ZWluIDxhbWly
NzNpbEBnbWFpbC5jb20+CisgKiAgRGF0ZTogICBXZWQgQXByIDI0IDE5OjM5OjUwIDIwMTkgKzAz
MDAKKyAqCisgKiAgICAgIG92bDogZG8gbm90IGdlbmVyYXRlIGR1cGxpY2F0ZSBmc25vdGlmeSBl
dmVudHMgZm9yICJmYWtlIiBwYXRoCiAgKi8KICNkZWZpbmUgX0dOVV9TT1VSQ0UKICNpbmNsdWRl
ICJjb25maWcuaCIKQEAgLTU0LDggKzYyLDE4IEBAIHN0YXRpYyBpbnQgZmRfbm90aWZ5W0ZBTk9U
SUZZX1BSSU9SSVRJRVNdW0dST1VQU19QRVJfUFJJT107CiAKIHN0YXRpYyBjaGFyIGV2ZW50X2J1
ZltFVkVOVF9CVUZfTEVOXTsKIAotI2RlZmluZSBNT1VOVF9OQU1FICJtbnRwb2ludCIKLXN0YXRp
YyBpbnQgbW91bnRfY3JlYXRlZDsKK3N0YXRpYyBjb25zdCBjaGFyIG1udHBvaW50W10gPSBPVkxf
QkFTRV9NTlRQT0lOVDsKKworc3RhdGljIGludCBvdmxfbW91bnRlZDsKKworc3RhdGljIHN0cnVj
dCB0Y2FzZSB7CisJY29uc3QgY2hhciAqdG5hbWU7CisJY29uc3QgY2hhciAqbW50OworCWludCB1
c2Vfb3ZlcmxheTsKK30gdGNhc2VzW10gPSB7CisJeyAiRmFub3RpZnkgbWVyZ2UgbW91bnQgbWFy
ayIsIG1udHBvaW50LCAwIH0sCisJeyAiRmFub3RpZnkgbWVyZ2Ugb3ZlcmxheWZzIG1vdW50IG1h
cmsiLCBPVkxfTU5ULCAxIH0sCit9OwogCiBzdGF0aWMgdm9pZCBjcmVhdGVfZmFub3RpZnlfZ3Jv
dXBzKHZvaWQpCiB7CkBAIC03MiwxMiArOTAsMTIgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2Zhbm90
aWZ5X2dyb3Vwcyh2b2lkKQogCQkJcmV0ID0gZmFub3RpZnlfbWFyayhmZF9ub3RpZnlbcF1baV0s
CiAJCQkJCSAgICBGQU5fTUFSS19BREQgfCBGQU5fTUFSS19NT1VOVCwKIAkJCQkJICAgIEZBTl9N
T0RJRlksCi0JCQkJCSAgICBBVF9GRENXRCwgIi4iKTsKKwkJCQkJICAgIEFUX0ZEQ1dELCBmbmFt
ZSk7CiAJCQlpZiAocmV0IDwgMCkgewogCQkJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sCiAJCQkJ
CSJmYW5vdGlmeV9tYXJrKCVkLCBGQU5fTUFSS19BREQgfCAiCiAJCQkJCSJGQU5fTUFSS19NT1VO
VCwgRkFOX01PRElGWSwgQVRfRkRDV0QsIgotCQkJCQkiICcuJykgZmFpbGVkIiwgZmRfbm90aWZ5
W3BdW2ldKTsKKwkJCQkJIiAlcykgZmFpbGVkIiwgZmRfbm90aWZ5W3BdW2ldLCBmbmFtZSk7CiAJ
CQl9CiAJCQkvKiBBZGQgaWdub3JlIG1hcmsgZm9yIGdyb3VwcyB3aXRoIGhpZ2hlciBwcmlvcml0
eSAqLwogCQkJaWYgKHAgPT0gMCkKQEAgLTEzMCwxMSArMTQ4LDIzIEBAIHN0YXRpYyB2b2lkIHZl
cmlmeV9ldmVudChpbnQgZ3JvdXAsIHN0cnVjdCBmYW5vdGlmeV9ldmVudF9tZXRhZGF0YSAqZXZl
bnQpCiAJfQogfQogCi12b2lkIHRlc3QwMSh2b2lkKQordm9pZCB0ZXN0X2Zhbm90aWZ5KHVuc2ln
bmVkIGludCBuKQogewogCWludCByZXQ7CiAJdW5zaWduZWQgaW50IHAsIGk7CiAJc3RydWN0IGZh
bm90aWZ5X2V2ZW50X21ldGFkYXRhICpldmVudDsKKwlzdHJ1Y3QgdGNhc2UgKnRjID0gJnRjYXNl
c1tuXTsKKworCXRzdF9yZXMoVElORk8sICJUZXN0ICMlZDogJXMiLCBuLCB0Yy0+dG5hbWUpOwor
CisJaWYgKHRjLT51c2Vfb3ZlcmxheSAmJiAhb3ZsX21vdW50ZWQpIHsKKwkJdHN0X3JlcyhUQ09O
RiwKKwkJICAgICAgICAib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVkIGluIHRoaXMga2VybmVs
LiIpOworCQlyZXR1cm47CisJfQorCisJc3ByaW50ZihmbmFtZSwgIiVzL3RmaWxlXyVkIiwgdGMt
Pm1udCwgZ2V0cGlkKCkpOworCVNBRkVfVE9VQ0goZm5hbWUsIDA2NDQsIE5VTEwpOwogCiAJY3Jl
YXRlX2Zhbm90aWZ5X2dyb3VwcygpOwogCkBAIC0xOTYsMzEgKzIyNiwyNiBAQCB2b2lkIHRlc3Qw
MSh2b2lkKQogCiBzdGF0aWMgdm9pZCBzZXR1cCh2b2lkKQogewotCVNBRkVfTUtESVIoTU9VTlRf
TkFNRSwgMDc1NSk7Ci0JU0FGRV9NT1VOVChNT1VOVF9OQU1FLCBNT1VOVF9OQU1FLCAibm9uZSIs
IE1TX0JJTkQsIE5VTEwpOwotCW1vdW50X2NyZWF0ZWQgPSAxOwotCVNBRkVfQ0hESVIoTU9VTlRf
TkFNRSk7Ci0KLQlzcHJpbnRmKGZuYW1lLCAidGZpbGVfJWQiLCBnZXRwaWQoKSk7Ci0JU0FGRV9G
SUxFX1BSSU5URihmbmFtZSwgIjEiKTsKKwlvdmxfbW91bnRlZCA9IFRTVF9NT1VOVF9PVkVSTEFZ
KCk7CiB9CiAKIHN0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKIHsKIAljbGVhbnVwX2Zhbm90aWZ5
X2dyb3VwcygpOwogCi0JU0FGRV9DSERJUigiLi4vIik7Ci0KLQlpZiAobW91bnRfY3JlYXRlZCAm
JiB0c3RfdW1vdW50KE1PVU5UX05BTUUpIDwgMCkKLQkJdHN0X2JyayhUQlJPSyB8IFRFUlJOTywg
InVtb3VudCBmYWlsZWQiKTsKKwlpZiAob3ZsX21vdW50ZWQpCisJCVNBRkVfVU1PVU5UKE9WTF9N
TlQpOwogfQogCiBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Ci0JLnRlc3RfYWxsID0g
dGVzdDAxLAorCS50ZXN0ID0gdGVzdF9mYW5vdGlmeSwKKwkudGNudCA9IEFSUkFZX1NJWkUodGNh
c2VzKSwKIAkuc2V0dXAgPSBzZXR1cCwKIAkuY2xlYW51cCA9IGNsZWFudXAsCiAJLm5lZWRzX3Rt
cGRpciA9IDEsCi0JLm5lZWRzX3Jvb3QgPSAxCisJLm5lZWRzX3Jvb3QgPSAxLAorCS5tb3VudF9k
ZXZpY2UgPSAxLAorCS5tbnRwb2ludCA9IG1udHBvaW50LAogfTsKIAogI2Vsc2UKLS0gCjIuMTcu
MQoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
