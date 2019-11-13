Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B1F9FA4
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:57:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1330D3C252F
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:57:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8AEC43C2452
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:41 +0100 (CET)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 27CF460111F
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:41 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id b3so296597wrs.13
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+razEwi/kUdkfEWdO/g81lGwxTbIvpUc8+gFiPt36M=;
 b=nIaWdzVrZRpAw08cBs8tBTbrl05pwoQHv3ny3iTnwvHDzup8tiYm7tPn3rlFVvJc0k
 NymB645qx8EhHJXhiiQOg8IuRqJ2mk0Dp9lvEa0HBKNqavkPvuuLZbExRbzrLd0NJB/9
 iSdXhRUgKWMQ39SzkwMe9sitaMJ/+o6rDzR87wU7qInCpuNVGgjjyCVoDcvbnD165Fa4
 a3CoH//itXVbuLUyeWIghhYUCr5iOIzxkqKepbB50sQ+kZ8si/uMiewqz7BDAusk0ZXE
 lhpTLIMlljgowWUvcjBESZJmfIxICosJbXuEHGN+YDVEolSKpML2eimJW/qjqpQ/I8aZ
 26tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+razEwi/kUdkfEWdO/g81lGwxTbIvpUc8+gFiPt36M=;
 b=BUmtTnOQaCVwdmQQAUmPDN4k/ZYG/oLhcwiweCxw7qroXj51Eyu9zdZK8yqTfQ+t5u
 v8BA3OcdZ36LSNcSBwo5r7f+QEgEoUk2L9vSYd4I9fx/S8tSm+uafvdf3V338OJKrE0U
 AWnKQ1/GB8L8lDngyBNfkwdbaDLGAAbTkcueMmPrJmLYfvo+zR9iLnu9cRjR2Gcu3jIj
 UG5OT2advMPv0SRueZuHGcNl+RWhKOPQRyqXy/9p6yt9Xw+2PfR/GxRdo1KWIiHypDA4
 hfCOiFc+PfIx+HsKaulLDTQnG8rWIWpb3MPO1ywHpGBRx+hrDMHcFaO5X189/xCurjCC
 30pg==
X-Gm-Message-State: APjAAAWNPzrOOHBkFwa3ve56pVGq008p5sWt2W7UNLGfAsqszA9M7R1D
 SKUXrF29nnzY7FfUUV/XsGg1a0Nr
X-Google-Smtp-Source: APXvYqz2zhZwteeujfKzUkNBpULOxYBscqAZbaIXdeYLMpwM4tLDEmpfa+nQPAQd8VPvAXu4RCBeow==
X-Received: by 2002:a05:6000:18c:: with SMTP id
 p12mr156865wrx.154.1573606600284; 
 Tue, 12 Nov 2019 16:56:40 -0800 (PST)
Received: from x230.suse.cz ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z4sm431546wmf.36.2019.11.12.16.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:56:39 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 13 Nov 2019 01:56:26 +0100
Message-Id: <20191113005626.19585-4-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113005626.19585-1-petr.vorel@gmail.com>
References: <20191113005626.19585-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] fanotify: Detect val vs. __val
 fanotify_event_info_fid.fsid member
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
Cc: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

dmlhIEZTSURfVkFMX01FTUJFUigpIG1hY3JvIGFuZCBhdXRvdG9vbHMgZGV0ZWN0aW9uLgoKVGhp
cyBmaXhlcyBidWlsZCBvbiBtdXNsLCB3aGljaCBhbHNvIGRlZmluZXMgZmFub3RpZnlfZXZlbnRf
aW5mb19maWQsCmJ1dCB1c2VzIGZzaWRfdCB0eXBlIGZvciBmc2lkIGluc3RlYWQgb2YgX19rZXJu
ZWxfZnNpZF90Lgpmc2lkX3QgdHlwZSBoYXMgX192YWxbMl0gbWVtYmVyICh1bmxpa2UgdmFsWzJd
IGluIF9fa2VybmVsX2ZzaWRfdCkuCgpGaXhlZCBlcnJvcjoKCmZhbm90aWZ5MTMuYzogSW4gZnVu
Y3Rpb24g4oCYZG9fdGVzdOKAmToKZmFub3RpZnkxMy5jOjI3ODoyMDogZXJyb3I6IOKAmGZzaWRf
dOKAmSB7YWthIOKAmHN0cnVjdCBfX2ZzaWRfdOKAmX0gaGFzIG5vIG1lbWJlciBuYW1lZCDigJh2
YWzigJk7IGRpZCB5b3UgbWVhbiDigJhfX3ZhbOKAmT8KICAgIGV2ZW50X2ZpZC0+ZnNpZC52YWxb
MF0sCgkJICAgIF5+fgouLi8uLi8uLi8uLi9pbmNsdWRlL3RzdF90ZXN0Lmg6NDk6NTM6IG5vdGU6
IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYdHN0X3Jlc+KAmQogIHRzdF9yZXNfKF9fRklMRV9f
LCBfX0xJTkVfXywgKHR0eXBlKSwgKGFyZ19mbXQpLCAjI19fVkFfQVJHU19fKQoJCQkJCQkgICAg
IF5+fn5+fn5+fn5+CmZhbm90aWZ5MTMuYzoyNzk6MjA6IGVycm9yOiDigJhmc2lkX3TigJkge2Fr
YSDigJhzdHJ1Y3QgX19mc2lkX3TigJl9IGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYdmFs4oCZOyBk
aWQgeW91IG1lYW4g4oCYX192YWzigJk/CiAgICBldmVudF9maWQtPmZzaWQudmFsWzFdLAoKU2ln
bmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+Ci0tLQpDaGFuZ2Vz
IHYxLT52MjoKKiBhY2Nlc3MgbWVtYmVycyB2aWEgbWFjcm8gRlNJRF9WQUxfTUVNQkVSKCkKKiB1
c2UgYXV0b3Rvb2xzIGRldGVjdGlvbiAKCiBtNC9sdHAtZmFub3RpZnkubTQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDEgKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlm
eS9mYW5vdGlmeS5oICAgfCA2ICsrKysrKwogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5v
dGlmeS9mYW5vdGlmeTEzLmMgfCA4ICsrKystLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2Zhbm90aWZ5L2Zhbm90aWZ5MTUuYyB8IDQgKystLQogNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL200L2x0cC1mYW5vdGlmeS5t
NCBiL200L2x0cC1mYW5vdGlmeS5tNAppbmRleCBlN2I3N2Q4YTQuLmYyZTMxZWI2OCAxMDA2NDQK
LS0tIGEvbTQvbHRwLWZhbm90aWZ5Lm00CisrKyBiL200L2x0cC1mYW5vdGlmeS5tNApAQCAtNCw0
ICs0LDUgQEAgZG5sIENvcHlyaWdodCAoYykgMjAxOSBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdt
YWlsLmNvbT4KIEFDX0RFRlVOKFtMVFBfQ0hFQ0tfRkFOT1RJRlldLFsKIEFDX0NIRUNLX1RZUEVT
KFtzdHJ1Y3QgZmFub3RpZnlfZXZlbnRfaW5mb19oZWFkZXJdLCwsWyNpbmNsdWRlIDxzeXMvZmFu
b3RpZnkuaD5dKQogQUNfQ0hFQ0tfVFlQRVMoW3N0cnVjdCBmYW5vdGlmeV9ldmVudF9pbmZvX2Zp
ZF0sLCxbI2luY2x1ZGUgPHN5cy9mYW5vdGlmeS5oPl0pCitBQ19DSEVDS19NRU1CRVJTKFtzdHJ1
Y3QgZmFub3RpZnlfZXZlbnRfaW5mb19maWQuZnNpZC5fX3ZhbF0sLCxbI2luY2x1ZGUgPHN5cy9m
YW5vdGlmeS5oPl0pCiBdKQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9m
YW5vdGlmeS9mYW5vdGlmeS5oIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9m
YW5vdGlmeS5oCmluZGV4IDlkMmZkZWQxMy4uNTM3MGUzMGJiIDEwMDY0NAotLS0gYS90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmgKKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5oCkBAIC0xNDMsNiArMTQzLDEyIEBAIHN0
cnVjdCBmYW5vdGlmeV9ldmVudF9pbmZvX2ZpZCB7CiB9OwogI2VuZGlmIC8qIEhBVkVfU1RSVUNU
X0ZBTk9USUZZX0VWRU5UX0lORk9fRklEICovCiAKKyNpZmRlZiBIQVZFX1NUUlVDVF9GQU5PVElG
WV9FVkVOVF9JTkZPX0ZJRF9GU0lEX19fVkFMCisjIGRlZmluZSBGU0lEX1ZBTF9NRU1CRVIoZnNp
ZCwgaSkgKGZzaWQuX192YWxbaV0pCisjZWxzZQorIyBkZWZpbmUgRlNJRF9WQUxfTUVNQkVSKGZz
aWQsIGkpIChmc2lkLnZhbFtpXSkKKyNlbmRpZiAvKiBIQVZFX1NUUlVDVF9GQU5PVElGWV9FVkVO
VF9JTkZPX0ZJRF9GU0lEX19fVkFMICovCisKICNpZmRlZiBIQVZFX05BTUVfVE9fSEFORExFX0FU
CiAvKgogICogSGVscGVyIGZ1bmN0aW9uIHVzZWQgdG8gb2J0YWluIGZzaWQgYW5kIGZpbGVfaGFu
ZGxlIGZvciBhIGdpdmVuIHBhdGguCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFu
b3RpZnkvZmFub3RpZnkxMy5jCmluZGV4IDAzMDczNDI4NS4uYjBkOWZiNWI2IDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYworKysgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYwpAQCAtMTMwLDgg
KzEzMCw4IEBAIHN0YXRpYyBpbnQgc2V0dXBfbWFya3ModW5zaWduZWQgaW50IGZkLCBzdHJ1Y3Qg
dGVzdF9jYXNlX3QgKnRjKQogCQkJCQkia2VybmVsIik7CiAJCQkJcmV0dXJuIDE7CiAJCQl9IGVs
c2UgaWYgKGVycm5vID09IEVOT0RFViAmJgotCQkJCQkhZXZlbnRfc2V0W2ldLmZzaWQudmFsWzBd
ICYmCi0JCQkJCSFldmVudF9zZXRbaV0uZnNpZC52YWxbMV0pIHsKKwkJCQkJIUZTSURfVkFMX01F
TUJFUihldmVudF9zZXRbaV0uZnNpZCwgMCkgJiYKKwkJCQkJIUZTSURfVkFMX01FTUJFUihldmVu
dF9zZXRbaV0uZnNpZCwgMSkpIHsKIAkJCQl0c3RfcmVzKFRDT05GLAogCQkJCQkiRkFOX1JFUE9S
VF9GSUQgbm90IHN1cHBvcnRlZCBvbiAiCiAJCQkJCSJmaWxlc3lzdGVtIHR5cGUgJXMiLApAQCAt
Mjc1LDggKzI3NSw4IEBAIHN0YXRpYyB2b2lkIGRvX3Rlc3QodW5zaWduZWQgaW50IG51bWJlcikK
IAkJCSJhbmQgbmFtZV90b19oYW5kbGVfYXQoMikiLAogCQkJbWV0YWRhdGEtPm1hc2ssCiAJCQln
ZXRwaWQoKSwKLQkJCWV2ZW50X2ZpZC0+ZnNpZC52YWxbMF0sCi0JCQlldmVudF9maWQtPmZzaWQu
dmFsWzFdLAorCQkJRlNJRF9WQUxfTUVNQkVSKGV2ZW50X2ZpZC0+ZnNpZCwgMCksCisJCQlGU0lE
X1ZBTF9NRU1CRVIoZXZlbnRfZmlkLT5mc2lkLCAxKSwKIAkJCSoodW5zaWduZWQgbG9uZyAqKSBl
dmVudF9maWxlX2hhbmRsZS0+Zl9oYW5kbGUpOwogCX0KIG91dDoKZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxNS5jIGIvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMKaW5kZXggZTllOTI2MDc4Li40OGVk
MzY4YWUgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFu
b3RpZnkxNS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3Rp
ZnkxNS5jCkBAIC0xOTIsOCArMTkyLDggQEAgc3RhdGljIHZvaWQgZG9fdGVzdCh2b2lkKQogCQkJ
CSJmaWQ9JXguJXguJWx4IHZhbHVlcyIsCiAJCQkJbWV0YWRhdGEtPm1hc2ssCiAJCQkJZ2V0cGlk
KCksCi0JCQkJZXZlbnRfZmlkLT5mc2lkLnZhbFswXSwKLQkJCQlldmVudF9maWQtPmZzaWQudmFs
WzFdLAorCQkJCUZTSURfVkFMX01FTUJFUihldmVudF9maWQtPmZzaWQsIDApLAorCQkJCUZTSURf
VkFMX01FTUJFUihldmVudF9maWQtPmZzaWQsIDEpLAogCQkJCSoodW5zaWduZWQgbG9uZyAqKQog
CQkJCWV2ZW50X2ZpbGVfaGFuZGxlLT5mX2hhbmRsZSk7CiAJCX0KLS0gCjIuMjQuMAoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
