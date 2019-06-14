Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23158460FA
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 16:37:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA9CE294B0A
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 16:37:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CCC133EA505
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 16:37:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4AD19601C48
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 16:37:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 263A1AEA4;
 Fri, 14 Jun 2019 14:37:24 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20190613161414.29161-1-pvorel@suse.cz>
 <20190613161414.29161-5-pvorel@suse.cz>
 <55f6fec4-ef01-db2b-62c0-cbbbf79c6c12@suse.de>
 <20190614141449.GA24614@dell5510>
From: Ignaz Forster <iforster@suse.de>
Message-ID: <794ee977-463f-6670-fac6-3e27e25d64ab@suse.de>
Date: Fri, 14 Jun 2019 16:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614141449.GA24614@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QW0gMTQuMDYuMTkgdW0gMTY6MTQgVWhyIHNjaHJpZWIgUGV0ciBWb3JlbDoKPj4+ICsrKyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9SRUFETUUubWQKPj4+
IEBAIC0wLDAgKzEsODMgQEAKPj4+ICtJTUEgKyBFVk0gdGVzdGluZwo+Pj4gKz09PT09PT09PT09
PT09PT09Cj4+PiArCj4+PiArSU1BIHRlc3RzCj4+PiArLS0tLS0tLS0tCj4+PiArCj4+PiArYGlt
YV9tZWFzdXJlbWVudHMuc2hgIHJlcXVpcmUgYnVpbHRpbiBJTUEgdGNiIHBvbGljeSB0byBiZSBs
b2FkZWQKPj4+ICsoYGltYV9wb2xpY3k9dGNiYCBvciBgaW1hX3BvbGljeT1hcHByYWlzZV90Y2Jg
IGtlcm5lbCBwYXJhbWV0ZXIpLgo+IAo+PiBUaGlzIHRlc3QgcmVxdWlyZXMgImFwcHJhaXNlX3Rj
YiIgKCJ0Y2IiIGlzIG5vdCBlbm91Z2gpLCBhcyB0aGUgZXJyb3JzIG9ubHkKPj4gb2NjdXIgZHVy
aW5nIGFwcHJhaXNhbC4KPiBBcmUgeW91IHN1cmU/IFRoaXMgaXMgYSBub3RlIGZvciBpbWFfbWVh
c3VyZW1lbnRzLnNoIHRlc3QgKG5vdCBmb3IgZXZtX292ZXJsYXkuc2gpLgo+IEkgcmVxdWlyZSBp
bWFfcG9saWN5PXRjYiBoZXJlLCBhY2NvcmRpbmcgdG8gTWltaSBbMV0KCk9oLCBzb3JyeSwgeW91
IGFyZSBjb3JyZWN0IC0gInRjYiIgaXMgY29ycmVjdCBpbiB0aGlzIGNhc2UuIEkgZ290IApjb25m
dXNlZCBhcyB0aGUgZG9jdW1lbnRhdGlvbiBpcyBpbmNsdWRlZCBpbiB0aGUgb3ZlcmxheWZzIHJl
cHJvZHVjZXIgcGF0Y2guCgpJZ25hegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
