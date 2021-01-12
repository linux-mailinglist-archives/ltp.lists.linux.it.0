Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB42F2BFA
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:57:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC0CA3C5DD1
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:57:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 612563C26C0
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:57:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 07874601387
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:57:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F318AB92;
 Tue, 12 Jan 2021 09:57:45 +0000 (UTC)
To: Li Wang <liwang@redhat.com>
References: <20210111161103.22433-1-mdoucha@suse.cz>
 <20210111161103.22433-2-mdoucha@suse.cz>
 <CAEemH2e_5gCmtieHVDiXRv27=hPA+ZOyH+vRSjkhnRO5e=ZcxA@mail.gmail.com>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <194adee8-76e5-f83a-d2dc-b6078cc0a513@suse.cz>
Date: Tue, 12 Jan 2021 10:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CAEemH2e_5gCmtieHVDiXRv27=hPA+ZOyH+vRSjkhnRO5e=ZcxA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] Add tst_secureboot_enabled() helper
 function
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTIuIDAxLiAyMSA5OjM0LCBMaSBXYW5nIHdyb3RlOgo+IFdlIGhhdmUgdG8gaW5jbHVkZcKg
dGhlICJ0c3RfcHJpdmF0ZS5oIiBoZWFkZXIgZmlsZSBvdGhlcndpc2UgY29tcGlsZXIKPiBmYWls
ZWQgdG8gYnVpbGQgaXQuCgpSaWdodCwgc29ycnkuIEkgcmFuIGEgY2xlYW4gYnVpbGQgYWZ0ZXIg
bW92aW5nIHRoZSBkZWNsYXJhdGlvbiBhbmQKZGlkbid0IG5vdGljZSB0aGUgaW1wbGljaXQgZGVj
bGFyYXRpb24gd2FybmluZy4gSSdsbCByZXN1Ym1pdCBpbiBhIG1vbWVudC4KCi0tIApNYXJ0aW4g
RG91Y2hhICAgbWRvdWNoYUBzdXNlLmN6ClFBIEVuZ2luZWVyIGZvciBTb2Z0d2FyZSBNYWludGVu
YW5jZQpTVVNFIExJTlVYLCBzLnIuby4KQ09SU08gSUlhCktyaXppa292YSAxNDgvMzQKMTg2IDAw
IFByYWd1ZSA4CkN6ZWNoIFJlcHVibGljCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
