Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9631B548
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 06:34:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 974923C59A7
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 06:34:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 58D1E3C5994
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 06:34:21 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BDFE560074E
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 06:34:20 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 02D7B9F626;
 Mon, 15 Feb 2021 05:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1613367259; bh=LZw3u4q+ACCjZrz8Vjy1YH7elXFiqBydzrwLUUeKGdw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=iEPdICGa1JJRYSCIqpiInTczQrEZYbfk10eHCyjJUD1yMFGJuzEBuuji6c61nK2ei
 g6wO6rMV08+JqJsBUBTOEDi/aqbVPmeTvFuZReiubuLyzNYGoUsfGlj7l22l8SEPhI
 Xrm3zJERlY7dtcr28gE7zxG+effwW/6//NeE7f/o=
To: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>
References: <20210212151525.20112-1-chrubis@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <853a0890-6426-5708-88a8-692885b9dd6f@jv-coder.de>
Date: Mon, 15 Feb 2021 06:35:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212151525.20112-1-chrubis@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [COMMITTED] [PATCH] mq_timedreceive_5-3: Initialize
 maxmsg properly
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQ3lyaWwsCgpPbiAyLzEyLzIwMjEgNDoxNSBQTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOgo+IFRo
ZSB0ZXN0IGNhbiBiZSBhY3R1YWxseSBleGVjdXRlZCBhcyBub24tcm9vdCB1c2VyIGJ1dCB0aGUg
bWF4bXNnIG11c3QKPiBiZSBzZXQgdG8gYSB2YWx1ZSB0aGF0IGlzIGxlc3MgYnkgdXNlciBsaW1p
dCBmb3IgbWVzc2FnZXMgYW5kIHNpbmNlIHdlCj4gZG8gbm90IHNlbmQgYW55IG1lc3NhZ2VzIHdl
IGNhbiBzYWZlbHkgaW5pdGlhbGl6ZSBpdCB0byAxLgpUaGlzIGlzIGFwcGxpZXMgdG8gbW9yZSB0
aGFuIG9ubHkgdGhpcyB0ZXN0LiBJIGFsc28gcmVjb2duaXplZCB0aGlzIHdoZW4gCmZpeGluZyB0
aGUgdGltZSBpc3N1ZSwgYnV0IGRlY2lkZWQgbm90IHRvIGNoYW5nZSBpdCwgYmVjYXVzZSBpdCBp
cyBub3QgCnRoZSBvbmx5IGFmZmVjdGVkIHRlc3QuClRoZSBtYXggbWVzc2FnZSBzaXplIGNvdWxk
IGJlIHVwIHRvIC9wcm9jL3N5cy9mcy9tcXVldWUvbXNnX21heC4gVGhpcyBpcyAKdXN1YWxseSAx
MC4KCkrDtnJnCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
