Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43346054
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 16:14:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68C92294B08
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 16:14:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 51C90294AB4
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 16:14:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EDC39600CE4
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 16:14:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 240A5AED5;
 Fri, 14 Jun 2019 14:14:54 +0000 (UTC)
Date: Fri, 14 Jun 2019 16:14:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ignaz Forster <iforster@suse.de>
Message-ID: <20190614141449.GA24614@dell5510>
References: <20190613161414.29161-1-pvorel@suse.cz>
 <20190613161414.29161-5-pvorel@suse.cz>
 <55f6fec4-ef01-db2b-62c0-cbbbf79c6c12@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55f6fec4-ef01-db2b-62c0-cbbbf79c6c12@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4 4/4] ima: Add overlay test + doc
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

SGkgSWduYXosCgp0aGFua3MgZm9yIHBvaW50aW5nIG91dCBhbGwgdGhlIHR5cG9zIGFuZCB3cm9u
ZyBncmVwIChwcmV2aW91cyBwYXRjaCkuCkdvaW5nIHRvIHNlbnQgdjUgd2l0aCBmaXhlcy4gSnVz
dCBvbmUgcXVlc3Rpb24gYmVsb3cuCgouLi4KPiA+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2Vj
dXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9SRUFETUUubWQKPiA+IEBAIC0wLDAgKzEsODMgQEAK
PiA+ICtJTUEgKyBFVk0gdGVzdGluZwo+ID4gKz09PT09PT09PT09PT09PT09Cj4gPiArCj4gPiAr
SU1BIHRlc3RzCj4gPiArLS0tLS0tLS0tCj4gPiArCj4gPiArYGltYV9tZWFzdXJlbWVudHMuc2hg
IHJlcXVpcmUgYnVpbHRpbiBJTUEgdGNiIHBvbGljeSB0byBiZSBsb2FkZWQKPiA+ICsoYGltYV9w
b2xpY3k9dGNiYCBvciBgaW1hX3BvbGljeT1hcHByYWlzZV90Y2JgIGtlcm5lbCBwYXJhbWV0ZXIp
LgoKPiBUaGlzIHRlc3QgcmVxdWlyZXMgImFwcHJhaXNlX3RjYiIgKCJ0Y2IiIGlzIG5vdCBlbm91
Z2gpLCBhcyB0aGUgZXJyb3JzIG9ubHkKPiBvY2N1ciBkdXJpbmcgYXBwcmFpc2FsLgpBcmUgeW91
IHN1cmU/IFRoaXMgaXMgYSBub3RlIGZvciBpbWFfbWVhc3VyZW1lbnRzLnNoIHRlc3QgKG5vdCBm
b3IgZXZtX292ZXJsYXkuc2gpLgpJIHJlcXVpcmUgaW1hX3BvbGljeT10Y2IgaGVyZSwgYWNjb3Jk
aW5nIHRvIE1pbWkgWzFdCgpLaW5kIHJlZ2FyZHMsClBldHIKClsxXSBodHRwOi8vbGlzdHMubGlu
dXguaXQvcGlwZXJtYWlsL2x0cC8yMDE5LUp1bmUvMDEyMzYzLmh0bWwKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
