Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4B22633
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 07:25:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62D5A3EA52F
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 07:25:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8E2353EA1BF
 for <ltp@lists.linux.it>; Sun, 19 May 2019 07:25:33 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5C65A1A00EAF
 for <ltp@lists.linux.it>; Sun, 19 May 2019 07:25:25 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id g9so5185204plm.6
 for <ltp@lists.linux.it>; Sat, 18 May 2019 22:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=hSKTpQcfg3rfASEkhIKyNkRs6xeeBhiNU87sff9rjFM=;
 b=SuKXsTkfuxiicnYmbs7RAEkce5uTOBCTPltxCWP6/fixuQDbLEsLkZDWyl9+hgqM+l
 Ed6/acAaPoyGF1t4lbl6PAUb0aSjwx79RLWmKGa1BmH3WCVt4L38rcfqfyRQwkg78mT5
 J/ISSOvIMJYt45E3eJiQ2mK8wpj38VJFM/WQwXOWuXiQQ3daI4Hty9Qp4rIq5frhCTBN
 i0EN4oKRjFLVIBe4i/Swet9ZRxZ2NTrjviAbEaJExhbUVV3oxw8uwfXT9wHNHtO4Khlm
 IXJsRsvmmljaIh8L76uhew+eqydxHdMbyt68Rlx6dCcIlyQk1JGAjc15xI1G3FRkmO8e
 RExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=hSKTpQcfg3rfASEkhIKyNkRs6xeeBhiNU87sff9rjFM=;
 b=fcEAr0f6x/g7cb9GWvu2Qyw31fciOgxWvwwV0TzshBuV9OcsnTnlFmduUPeq11IBYv
 31c+1Zu4jGQpNYKl5Hi0mY9/vj7UB/yEsDfc6cZh89mVhEt+H/ymZ8Cz+sIIo0PfP4rr
 j4fCFKlhtirYFwItoRlyAeTAjYV/kmAxaBnKiKa3VxkhxOxbiME20uRnOLgPzeQd14WM
 2L4ntfvO7kgZAPwgj7szEKKjVe1cEe07hiUHaJdvG1O6FltJOtAPSsjVoRoA4fkkFlwY
 Iy1o79muiIzzYXiS6/4CP/N7Kv019UK0CKUH5sMNN6W/H/CnuyHGsIw/SizcS1SseIZl
 Zhww==
X-Gm-Message-State: APjAAAUv2D2HVN6Eu7lYjRGw/EJQJ3wbW3XOjadmYLk2ar08blnfj8gd
 4fJVDldHcF+2I7xmHMV9nqOME3VPrg==
X-Google-Smtp-Source: APXvYqyudZj3vdR66WaBVnDXlB9fwDVZa7+jg5tPRINhGNgL0EuVLfJgX30QVgGFYOyCOgaVcy7d3g==
X-Received: by 2002:a17:902:aa97:: with SMTP id
 d23mr68567768plr.313.1558243523472; 
 Sat, 18 May 2019 22:25:23 -0700 (PDT)
Received: from poseidon.Home (n114-74-156-190.sbr2.nsw.optusnet.com.au.
 [114.74.156.190])
 by smtp.gmail.com with ESMTPSA id s80sm39593288pfs.117.2019.05.18.22.25.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 May 2019 22:25:22 -0700 (PDT)
Date: Sun, 19 May 2019 15:25:13 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: ltp@lists.linux.it
Message-ID: <cover.1558242368.git.mbobrowski@mbobrowski.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: jack@suse.cz
Subject: [LTP] [PATCH v3 0/3] syscalls/fanotify: FAN_REPORT_FID and
 Directory Modification Events
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

VGhpcyBwYXRjaCBzZXJpZXMgY29udGFpbnMgdGhlIGNoYW5nZXMgbmVlZGVkIHRvIHZhbGlkYXRl
IHRoZSBuZXcKRkFOX1JFUE9SVF9GSUQgZmxhZyBhbmQgZGlyZWN0b3J5IG1vZGlmaWNhdGlvbiBl
dmVudCBmdW5jdGlvbmFsaXR5CndpdGhpbiB0aGUgZmFub3RpZnkgQVBJLgoKQ2hhbmdlcyBzaW5j
ZSB2ZXJzaW9uIDI6CgkqIEFkZGVkIGFuIGlmZGVmIHN0YXRlbWVudCB3aXRoaW4gZmFub3RpZnlf
Z2V0X2ZpZCgpIHRvIGNoZWNrCgkgIGZvciBuYW1lX3RvX2hhbmRsZV9hdCgpIHN1cHBvcnQuCgpN
YXR0aGV3IEJvYnJvd3NraSAoMyk6CiAgc3lzY2FsbHMvZmFub3RpZnkxMzogbmV3IHRlc3QgdG8g
dmVyaWZ5IEZBTl9SRVBPUlRfRklEIGZ1bmN0aW9uYWxpdHkKICBzeXNjYWxscy9mYW5vdGlmeTE0
OiBuZXcgdGVzdCB0byB2YWxpZGF0ZSBGQU5fUkVQT1JUX0ZJRCBpbnRlcmZhY2UKICB2YWx1ZXMK
ICBzeXNjYWxscy9mYW5vdGlmeTE1OiB2ZXJpZnkgZmlkIGZvciBkaXJlbnQgZXZlbnRzCgogY29u
ZmlndXJlLmFjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHJ1bnRl
c3Qvc3lzY2FsbHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArCiB0ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5Ly5naXRpZ25vcmUgfCAgIDMgKwogdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeS5oIHwgIDgxICsrKystCiAuLi4va2Vy
bmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyAgICAgfCAzMTMgKysrKysrKysrKysr
KysrKysrCiAuLi4va2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTQuYyAgICAgfCAx
NzEgKysrKysrKysrKwogLi4uL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMg
ICAgIHwgMjQ1ICsrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDgxNCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkxMy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE0LmMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTUuYwoKLS0g
CjIuMjEuMAoKLS0gCk1hdHRoZXcgQm9icm93c2tpCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
