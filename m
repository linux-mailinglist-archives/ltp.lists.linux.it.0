Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076531B801
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 12:30:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4653D3C59B8
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 12:30:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CA0653C1D23
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 12:30:24 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4B18360055D
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 12:30:24 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 21578A08AF;
 Mon, 15 Feb 2021 11:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1613388622; bh=6DAHh3VH+DQCOub0TENWntAfzo1mIdPi+23IzdlzN54=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=QTii17Vt+NcFMPkntrbdco8Dquicm4Ht0EbNkEpIDPXNWHMtT72LC3A7FUIhclorV
 p/1yaesFX/DGsHkC28DiZFVyCyJPzaeJsWuHSRDIPdxWEOo26Kro9SBHP4iqmq2I27
 xyJZC8YnlzMROaK3re0kX7qE+tZ/y2uxxuK2syGE=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210212151525.20112-1-chrubis@suse.cz>
 <853a0890-6426-5708-88a8-692885b9dd6f@jv-coder.de>
 <YCpTHC2FLaC5vzVH@yuki.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20de105c-086d-0116-c8a2-bc4c68684b31@jv-coder.de>
Date: Mon, 15 Feb 2021 12:31:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCpTHC2FLaC5vzVH@yuki.lan>
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpPbiAyLzE1LzIwMjEgMTE6NTUgQU0sIEN5cmlsIEhydWJpcyB3cm90ZToKPiBGZWVsIGZy
ZWUgdG8gc2VuZCBhIHBhdGNoIGZvciB0aGUgcmVzdCA6LSkuCkRvbid0IHdhbnQgdG8gbWFueSBv
cGVuIHBhdGNoZXMgYXQgdGhlIHNhbWUgdGltZSA7KQo+IExvb2tpbmcgYXQgdGhlIHJlc3Qgb2Yg
dGhlIHRlc3RzIEkgZ3Vlc3MgdGhlIG9yaWdpbmFsIGF1dGhvciBlaXRoZXIgZGlkCj4gbm90IGNh
cmUgdGhhdCBtdWNoIG9yIHdhcyBjbHVlbGVzcyBzaW5jZSBpdCBkb2VzIG5vdCByZWFsbHkgbWFr
ZSBzZW5zZQo+IHRvIHNldCBtcV9tYXhtc2cgdG8gdGhlIHNhbWUgbnVtYmVyIGFzIG1xX21zZ3Np
emUgaW4gdGVzdHMgdGhhdCBzZW5kCj4ganVzdCBvbmUgb3IgdHdvIG1lc3NhZ2UuCj4KPiBTbyB3
ZSBzaG91bGQgZWl0aGVyIHNldCBpdCB0byAyIGluIGFsbCB0ZXN0cywgb3Igc2V0IGl0IHRvIDEg
b3IgMgo+IGRlcGVuZGluZyBvbiBob3cgbWFueSBtZXNzYWdlcyB0ZXN0IHNlbmRzLgpDb3VsZG4n
dCBhZ3JlZSBtb3JlCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
