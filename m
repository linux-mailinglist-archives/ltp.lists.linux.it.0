Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574E23C71
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:43:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64A552D0147
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 17:43:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B1F562D013A
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:43:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 571E61A00EA0
 for <ltp@lists.linux.it>; Mon, 20 May 2019 17:43:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CD08AFE3;
 Mon, 20 May 2019 15:43:16 +0000 (UTC)
Date: Mon, 20 May 2019 17:43:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20190520154314.GA15837@dell5510>
References: <20190429124630.4834-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429124630.4834-1-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_net.sh: Remove -B option from
	tst_rhost_run()
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IFRoaXMgb3B0aW9uIHdhcyBhZGRlZCBpbiA2YmNmN2NlMDUgKCJsaWI6IHRzdF9yaG9z
dF9ydW46IG5ldyBvcHRpb24gLUIKPiBmb3Igc2F2aW5nIGJhY2tncm91bmQgbG9nIikgYW5kIHVz
ZWQgaW4gdHN0X2R1bXBfcmhvc3RfY21kKCkgYWRkZWQgaW4KPiA5MjFmYjJkMmMgKCJuZXR3b3Jr
L3RzdF9uZXRsb2FkOiBkdW1wIGJhY2tncm91bmQgbmV0c3RyZXNzIG91dHB1dCBvbgo+IGZhaWx1
cmUiKS4KPiBCdXQgZDZjZTMzYTJlICgibmV0c3RyZXNzOiBzZXQgcG9ydCBkeW5hbWljYWxseSBv
biB0aGUgc2VydmVyLXNpZGUiKQo+IG1vdmVkIGxvZ2dpbmcgaW50byBuZXRzdHJlc3MubG9nLCBj
cmVhdGVkIGJ5IG5ldHN0cmVzcy5jLCAtQiBpcyBub3QKPiB1c2VkIGFueSBtb3JlLgoKPiBOT1RF
OiBpZiB0aGlzIGZlYXR1cmUgaXMgcmVpbnRyb2R1Y2VkLCBpdCBzaG91bGQgY2hlY2sgd2hldGhl
cgo+IFRTVF9ORUVEU19UTVBESVI9MSBpcyBzZXQgKHNpbWlsYXIgdG8gZml4IGUzYTFhYTEwNiAo
Im5ldC90c3RfbmV0bG9hZDoKPiBUQlJPSyB3aGVuIFRTVF9ORUVEU19UTVBESVIgbm90IHNldCIp
KS4KCj4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+CgpNZXJnZWQu
CgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
