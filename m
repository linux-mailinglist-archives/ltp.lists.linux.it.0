Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A251135605
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 06:43:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 700073EA3BC
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 06:43:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0A43C3EA1EF
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 06:43:01 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 548D91400DB5
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 06:43:01 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id s27so6072391pgl.2
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 21:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kj1DvGGqoVkooPfiuEeUhdKBm/7m42MdUgI2ZjYxSc=;
 b=sp/jCy62A4CwJElgTr+9VsDAfDmcbfLLZFQczZD33USLw7wI1FrJ67pJd6/FrTxP6q
 6eopwPTJyS11obUL/wGtuqJtgq+ioZD6Z1M/yiygNOF2w+1M/AY/3UHSduwQVy9VpTrs
 1tcgns0b81cjs+TMKbqYXDhVNmG+/q8EqBZZB3YOyUvmwlxqXFNBPtVG4gbmEOaq1dAI
 MbO5nLkr1WcVCGghZLf3Ms1WAODzGHHT8M/jg8QcOBvvtTeVoCIDYZpw3YvSdy/HP2u5
 CA9A3FCWgug5F1d3fiUQBfUP+yrhKaUpoOrzoVEpE8vzM7oBMNiCmziWdGC6w/TlY6E6
 2XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kj1DvGGqoVkooPfiuEeUhdKBm/7m42MdUgI2ZjYxSc=;
 b=GA3TaCXRtJCNGmS0amDkdhgyWQ6m0JwRV9+pyqpFkkQuRMSRXc1K8kb7zIDveQYxGA
 mxJFGQs2RbkXbA1b+fI/I+JuyMKvZRfqtxbi+9hSHyHVJUOAlbA9cSxoQ90Vzi7mgqj8
 fQz9ys8Ju7KkTcg4N+o11VM6TsaF3/zHLYFnwavFo1skuBJlNgTnZSIwOSFpjveAa/hf
 CJGPAbdC7E4GdMM9+cmSFk4M+B59Scr1NhZ52xLzRGTA2PDs3AeDXWn4aziXYBxtLkal
 RXs1LS2IGuFjkWbsP6Z17CvAxMHtklPN4H0b+UuSdqZglNIAR7GMrLE+DPvHoWUaxMhC
 yAJQ==
X-Gm-Message-State: APjAAAWav9xBvjp9Q5KCuT3XhF/jWDyRU+jvL9/cT8q0Ei8q8174cPdS
 1AaSb39e+QLmhGvH/W2CLKmbAN5hfTk=
X-Google-Smtp-Source: APXvYqwKF5DbhIc+wLWa8Xf8/vfTKNY4A+uCFPXT2j73bvnQOJaXtLM0HfQuROHzc2zh0EIegDw7Rw==
X-Received: by 2002:a17:90a:35c8:: with SMTP id
 r66mr41656881pjb.17.1559709779517; 
 Tue, 04 Jun 2019 21:42:59 -0700 (PDT)
Received: from XZHOUW.usersys.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 12sm8984086pfi.60.2019.06.04.21.42.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 21:42:58 -0700 (PDT)
From: Murphy Zhou <jencce.kernel@gmail.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Wed,  5 Jun 2019 12:42:15 +0800
Message-Id: <20190605044215.19448-1-jencce.kernel@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604082331.uunxtzshdgcnv4xg@XZHOUW.usersys.redhat.com>
References: <20190604082331.uunxtzshdgcnv4xg@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/preadv2/preadv203: set mount_device flag
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tm93IHRoZSB0ZXN0cyBhcmUgcnVubmluZyBpbiBNT1VOVFBPSU5UIHdpdGhvdXQgaXQgbW91bnRl
ZC4KRmFpbHMgb24gZXh0MjoKICAgIHByZWFkdjIwMy5jIGRvZXMgbm90IHNldCBtb3VudF9kZXZp
Y2UsIHdoaWNoIG1ha2VzIEJST0s6CiAgICAgIHByZWFkdjIwMy5jOjEyMjogQlJPSzogcHJlYWR2
MigpIGZhaWxlZDogRU9QTk9UU1VQUAoKU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPGplbmNj
ZS5rZXJuZWxAZ21haWwuY29tPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvcHJlYWR2
Mi9wcmVhZHYyMDMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIwMy5jIGIv
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYyL3ByZWFkdjIwMy5jCmluZGV4IDgxMGQx
ZThkYi4uZTRmNjhhNTFiIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3By
ZWFkdjIvcHJlYWR2MjAzLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9wcmVhZHYy
L3ByZWFkdjIwMy5jCkBAIC0yNjEsNiArMjYxLDcgQEAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0
ZXN0ID0gewogCS5jbGVhbnVwID0gY2xlYW51cCwKIAkudGVzdF9hbGwgPSB2ZXJpZnlfcHJlYWR2
MiwKIAkubW50cG9pbnQgPSBNTlRQT0lOVCwKKwkubW91bnRfZGV2aWNlID0gMSwKIAkuYWxsX2Zp
bGVzeXN0ZW1zID0gMSwKIAkubmVlZHNfdG1wZGlyID0gMSwKIAkubmVlZHNfcm9vdCA9IDEsCi0t
IAoyLjIxLjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
