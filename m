Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC947FC4
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 12:35:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1877294AD0
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 12:35:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 423FB3EA4B7
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 12:35:12 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F142C1A013BE
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 12:35:03 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id x15so5476479pfq.0
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 03:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=z+QofpDH56KTzSrfcqQgQKQ4V4An87D8D81APm2aL+I=;
 b=y9ko5JbvAkrRgRwFdUaazT9ReJD3ywNn8ij0uJ7/0NRjQhq1tOgCq99koEZla1LUNV
 XQIyKQ17PexKMAxeL1b/iar4LqNN3IDcfOlLy+UBIwSPrwh7byElIofwdmcOeaszILK2
 wf8D/HwI8fN9vvxBaUUFsCS7QCw9mj2Svz6AZsu1A/ywhW2Hz6PBEG2HM4PGeMX2FKfo
 gducjnC9Wk0hxFQgHp7MNDMc1ls/evR3Iq0Lmi5UZi9qiiMfz9FjTokGf/VNny71MA8X
 nSOFI/qQVc4Vv/tXAiZQ5YWY6lFxMv8kMgYWZWtskJHos3bk54IYKzlTRugsf+o4Xa3v
 mtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=z+QofpDH56KTzSrfcqQgQKQ4V4An87D8D81APm2aL+I=;
 b=mwjwoBZ8JdNKpqCLOd9CRWiir1UBXUG0jbg0Xhq3OzUqZgyVBAiD71riqnEmiub9vG
 VIhaV8lqo+07tjnhSjHOYB0r80+6iDta9iBfgRJRsXmwXhXtITiZTNbmwpfyXgDKY/cY
 MF3yfaXDTWMnYwhFnFLwbD5IZWeHOCMicHCKmbYPrn7oqz+iQ8UH3AjZuQpWtPvTNAOG
 ZQQHOh6cpsvA30seVptzMtOeqZmlgL5O5be9LQIScE69zxh7p9yfPknRdQ/iZYUTFvqn
 FYNelzV9wuIthi2yVRxWLtFBjFsPTjhepzCd/ogXecbud5bhtLOFWFVuLiBRpu97vcUa
 0kcg==
X-Gm-Message-State: APjAAAXuvJvdT9ocVjE8TkPMcn7L0qYOuT7uApaYciUOsHG1gIp9uPfG
 2VgONnTU+gvANdAwsfyW6j3sJlzG1Q==
X-Google-Smtp-Source: APXvYqzgrB0CDqjo3O+uKS73kPYgK7DigpQtNYLjZ3m2Wi07IWlZ16fGqI4GlnMQfZGwpobn4ei8YA==
X-Received: by 2002:a17:90a:950d:: with SMTP id
 t13mr25188722pjo.81.1560767701885; 
 Mon, 17 Jun 2019 03:35:01 -0700 (PDT)
Received: from poseidon.Home ([114.78.0.167])
 by smtp.gmail.com with ESMTPSA id v13sm2953919pfe.105.2019.06.17.03.34.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 03:35:01 -0700 (PDT)
Date: Mon, 17 Jun 2019 20:34:55 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: ltp@lists.linux.it
Message-ID: <cover.1560766652.git.mbobrowski@mbobrowski.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: jack@suse.cz
Subject: [LTP] [PATCH v4 0/3] syscalls/fanotify: FAN_REPORT_FID and
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
ZSB2ZXJzaW9uIDM6CiAgICAgICAgKiBBZGRlZCBtaXNzaW5nIF9HTlVfU09VUkNFIGZlYXR1cmUg
bWFjcm8gZnJvbQogICAgICAgICAgc3lzY2FsbHMvZmFub3RpZnkwNS4KCSogTW92ZWQgZmFub3Rp
ZnlfZ2V0X2ZpZCgpIGluIGZhbm90aWZ5Lmggb3V0c2lkZSAjaWZuZGVmCgkgIEZBTl9SRVBPUlRf
RklEIHRvIGFjY29tbW9kYXRlIGZvciB0aGUgc2l0dWF0aW9uIHdoZXJlIExUUCBpcwoJICBidWls
dCBvbiBhIHN5c3RlbSB0aGF0IGhhcyBuZXdlciAoNS4xID4pIGtlcm5lbCBoZWFkZXJzCgkgIGlu
c3RhbGxlZC4KClRoYW5rcyBmb3IgeW91ciBoZWxwIEFtaXIgYW5kIEphbi4KCk1hdHRoZXcgQm9i
cm93c2tpICgzKToKICBzeXNjYWxscy9mYW5vdGlmeTEzOiBuZXcgdGVzdCB0byB2ZXJpZnkgRkFO
X1JFUE9SVF9GSUQgZnVuY3Rpb25hbGl0eQogIHN5c2NhbGxzL2Zhbm90aWZ5MTQ6IG5ldyB0ZXN0
IHRvIHZhbGlkYXRlIEZBTl9SRVBPUlRfRklEIGludGVyZmFjZQogICAgcmV0dXJuIHZhbHVlcwog
IHN5c2NhbGxzL2Zhbm90aWZ5MTU6IHZlcmlmeSBmaWQgZm9yIGRpcmVudCBldmVudHMKCiBjb25m
aWd1cmUuYWMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogcnVudGVz
dC9zeXNjYWxscyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKIHRlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvLmdpdGlnbm9yZSB8ICAgMyArCiB0ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5LmggfCAgODEgKysrKy0KIC4uLi9rZXJu
ZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkwNS5jICAgICB8ICAgMSArCiAuLi4va2VybmVs
L3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyAgICAgfCAzMTMgKysrKysrKysrKysrKysr
KysrCiAuLi4va2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTQuYyAgICAgfCAxNzEg
KysrKysrKysrKwogLi4uL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMgICAg
IHwgMjQ1ICsrKysrKysrKysrKysrCiA4IGZpbGVzIGNoYW5nZWQsIDgxNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvZmFub3RpZnkvZmFub3RpZnkxMy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTUuYwoKLS0gCjIu
MjEuMAoKCi0tIApNYXR0aGV3IEJvYnJvd3NraQoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
