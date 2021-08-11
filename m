Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8B3E91CF
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:47:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8629B3C6F4A
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:47:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79DB43C5D9E
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:46:55 +0200 (CEST)
Received: from smtpbg516.qq.com (smtpbg516.qq.com [203.205.250.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B5A7B1400F2B
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:46:53 +0200 (CEST)
X-QQ-mid: bizesmtp42t1628686002tf58x44k
Received: from [10.4.23.179] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 11 Aug 2021 20:46:41 +0800 (CST)
X-QQ-SSF: 0040000000200020B000000B0000000
X-QQ-FEAT: mtqT0IO8z2ihfm37hFPQm49mzgtG735BGyZN686jvMtZKDJALKlIxg55dU3Bb
 BzPl2XKr3rGPSjBroxI2kUVaVypHX8gVbZcBBo7ve0xCCJ3eh7tgPwPs7ERNn1+OEtsn3z6
 qwdlVGjkNzlTkwf1+e7kNw6mPPeSQsRsWGl4KvNlUE3oGviHlhAWJf1TB/PoMoao4Ux6H8o
 NRYwie7CFlBD/p3F1moyMshFsXBEiYmY5+tF3jY8UUFACprioGnGm33P+qdCOyGrT6Trmzb
 78+r/6ISjzzM1mlUz9UFuKTLSgd1VQ2DZ4HqjqiQjJ2oq9bUkyT/YJ6cTrZzzkNBiTy/yD1
 aE6IesIV8ANaC6Ld40=
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210806113115.8852-1-sujiaxun@uniontech.com>
 <YRJkpZCn1Oii1xFM@yuki>
From: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <dc227537-981b-58b9-f971-1ec1d92b3a99@uniontech.com>+161142CB4BD7C9FA
Date: Wed, 11 Aug 2021 20:46:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YRJkpZCn1Oii1xFM@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [6/6] syscalls/sysfs: Convert sysfs06 to the new
 API
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhhbmsgeW91IGZvciB5b3VyIGNhcmVmdWwgcmV2aWV3LiBJIGhhdmUgZm9sbG93ZWQgeW91ciBz
dWdnZXN0aW9uIGFuZCAKbWFkZSBjaGFuZ2VzIGFuZCBjb21wbGV0ZWQgdGhlIHN1Ym1pc3Npb24u
CgrU2iAyMDIxLzgvMTAgz8LO5zc6MzYsIEN5cmlsIEhydWJpcyDQtLXAOgo+IEhpIQo+IEFuZCB0
aGlzIGlzIG5lYXJseSB0aGUgc2FtZSBhcyBzeXNmczA1LCB0aGUgb25seSB0ZXN0IHRoYXQgaXMg
bWlzc2luZyBpbgo+IHN5c2ZzMDUgaXMgZnMgaW5kZXggb3V0IG9mIGJvdW5kcy4gU28gd2Ugc2hv
dWxkIGFkZCB0aGF0IHRlc3QgdG8KPiBzeXNmczA1IGFuZCByZW1vdmUgc3lzZnMwNi4KPiAKCi0t
IApLaW5kIHJlZ2FyZHMsCgpzdWppYXh1bgoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
