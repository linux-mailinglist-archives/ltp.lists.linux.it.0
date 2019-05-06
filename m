Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12915065
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 17:38:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1891A3EAEBC
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 17:38:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1AAB83EA65F
 for <ltp@lists.linux.it>; Mon,  6 May 2019 17:38:44 +0200 (CEST)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A90EE6005F7
 for <ltp@lists.linux.it>; Mon,  6 May 2019 17:38:45 +0200 (CEST)
Received: by mail-pg1-x54a.google.com with SMTP id 14so8236022pgo.14
 for <ltp@lists.linux.it>; Mon, 06 May 2019 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=0fVpLGLqvCFks3wqu36nBLdEgm9uj0iD381sMLInOo8=;
 b=ScyS7qdQ2Qx1UthKQ0F/i7G+uch+uLJ78etxZArs4nkZusEw5lhcDKdKheLyGdhuXY
 Anfx+VwQSqeQEShQN56GvCvh/c+wHxxj6K9UlWvgu/esd7gCY5PM71GlqNc1BFhg/2SF
 D/De1bSfbdMrKeMJVfTsoiVzhEVGvgms/XrpCc+63wRUe/PtZVTJHmRKBmhwRWhBBIY6
 zJWx2k/MoXQ+kdakf3KSlsGnVy72H0hN6NacfJVGjEpYLTBkU1hGxGU+rT6/d7gDqJ71
 lr8eDuaj44JNm9rrvyFlqqafGAgDLRyGTQMmht9cQptucmIyL9P943zu2soRDOoGq72q
 tmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=0fVpLGLqvCFks3wqu36nBLdEgm9uj0iD381sMLInOo8=;
 b=K3fRNjBU0nZ0LAiTwnUO72GfdwkGRpySB/d+r056ydmPk15Z0y3pl4H5/+VXXOlPej
 X1MILFxX/ABpYQemVz+0Rvc0Aa8gZofFGtPlBrOBiTPO/hDd+giTUWDY2A2yxsh7eV4h
 L1/eQBI7oXfJznoiDlTb2wZU7hmcxEmVx5gtfOO3QyqlMmpccRN+UjHzRJfgwafxqMto
 jFJGlee8+/Rdk7K8wglWzTFzFvPOQfa55qTAGyCmUE4WbOn3lNURvfZFfixPU3TmpT/V
 IHHJqqQkiHLCzgywr1+DYEZxtBcZJdKhHHDruOZzQ1AFFjSL9uTw+sia3ll0wvSK/xMi
 Jk4A==
X-Gm-Message-State: APjAAAW8WpMtUSPXnZBitv87nV3yprsi7bPqZSs3SWOQ+DlEO8tBFx/M
 IFBgchbHFPvIPqit40bLT8Yrh50X0vDbkKIq/w5DyxOFeAxGYRDdTGH+goHwY/RebeRTm/dt7XQ
 zGjJtkkAsRggw38nWpDibvii3eBRz8SOCYtxLYbq1plQS84zvz5g3Y3e/9/oR//oWAw2K6sDW
X-Google-Smtp-Source: APXvYqytDchNPqQqBfl/NmT/o6LvOZEyfLSnAHiyhq875KSP0q8ITIq5a0cyvNDxWG6RmPHMbCKVbJ2LYDL+dM/iMNg=
X-Received: by 2002:a63:7141:: with SMTP id b1mr32672308pgn.331.1557157121527; 
 Mon, 06 May 2019 08:38:41 -0700 (PDT)
Date: Mon,  6 May 2019 08:38:36 -0700
Message-Id: <20190506153836.232148-1-paullawrence@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Paul Lawrence <paullawrence@google.com>
To: ltp@lists.linux.it, kernel-team@android.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] ANDROID: Fix ioctl03 test for Android
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

QW5kcm9pZCBoYXMgdHVuIGZpbGUgYXQgL2Rldi90dW4gbm90IC9kZXYvbmV0L3R1bgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBMYXdyZW5jZSA8cGF1bGxhd3JlbmNlQGdvb2dsZS5jb20+Ci0tLQogdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bDAzLmMgfCA1ICsrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9pb2N0bC9pb2N0bDAzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3Rs
L2lvY3RsMDMuYwppbmRleCBiMWI1MGVkYjQuLmNjOWEyZWRhZiAxMDA2NDQKLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bDAzLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9pb2N0bC9pb2N0bDAzLmMKQEAgLTc5LDYgKzc5LDExIEBAIHN0YXRpYyB2b2lk
IHZlcmlmeV9mZWF0dXJlcyh2b2lkKQogCXVuc2lnbmVkIGludCBmZWF0dXJlcywgaTsKIAogCWlu
dCBuZXRmZCA9IG9wZW4oIi9kZXYvbmV0L3R1biIsIE9fUkRXUik7CisKKwkvKiBBbmRyb2lkIGhh
cyB0dW4gYXQgL2Rldi90dW4gKi8KKwlpZiAobmV0ZmQgPT0gLTEgJiYgKGVycm5vID09IEVOT0RF
ViB8fCBlcnJubyA9PSBFTk9FTlQpKQorCQluZXRmZCA9IG9wZW4oIi9kZXYvdHVuIiwgT19SRFdS
KTsKKwogCWlmIChuZXRmZCA9PSAtMSkgewogCQlpZiAoZXJybm8gPT0gRU5PREVWIHx8IGVycm5v
ID09IEVOT0VOVCkKIAkJCXRzdF9icmsoVENPTkYsICJUVU4gc3VwcG9ydCBpcyBtaXNzaW5nPyIp
OwotLSAKMi4yMS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
