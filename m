Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74B2992B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:44:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 401F33EA68A
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 15:44:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 433D63EA4D7
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:44:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B79EB200FD4
 for <ltp@lists.linux.it>; Fri, 24 May 2019 15:44:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E4FC7CB87;
 Fri, 24 May 2019 13:44:15 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0FB51001284;
 Fri, 24 May 2019 13:44:14 +0000 (UTC)
Date: Fri, 24 May 2019 21:44:12 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190524134412.xcc45ifc63cd5ypn@XZHOUW.usersys.redhat.com>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510>
 <20190524043201.sxmkm6b7dixn2kuw@XZHOUW.usersys.redhat.com>
 <20190524085452.GB29592@dell5510>
 <CAOQ4uxhBcMRg1+7sihQaTC217We8Hj+fAQ2xhiDTHvBDP4NZag@mail.gmail.com>
 <20190524122357.GA28108@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524122357.GA28108@dell5510>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 24 May 2019 13:44:15 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] OVL_MNT: add setup_overlay helper
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

SGkgZ3V5cywKClZlcnkgZ29vZCBpZGVhcyEgVGhhbmsgeW91IGJvdGggdmVyeSBtdWNoIQoKTQpP
biBGcmksIE1heSAyNCwgMjAxOSBhdCAwMjoyMzo1N1BNICswMjAwLCBQZXRyIFZvcmVsIHdyb3Rl
Ogo+IEhpIEFtaXIsCj4gCj4gdGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb25zLCBoaWdobHkgYXBw
cmVjaWF0ZWQgOikuCj4gLi4uCj4gPiA+ICNkZWZpbmUgU0FGRV9NT1VOVF9PVkVSTEFZKCkgXAo+
ID4gPiAgICAgICAgIG1vdW50X292ZXJsYXkoX19GSUxFX18sIF9fTElORV9fLCAxKTsKPiAKPiA+
ID4gI2RlZmluZSBUU1RfTU9VTlRfT1ZFUkxBWSgpIFwKPiA+ID4gICAgICAgICBtb3VudF9vdmVy
bGF5KF9fRklMRV9fLCBfX0xJTkVfXywgMCk7Cj4gCj4gCj4gPiBJIGxpa2UgdGhpcyB2ZXJzaW9u
IG9mIHRoZSBoZWxwZXJzL21hY3Jvcy4KPiAKPiA+IEkgd291bGQgY2hhbmdlIFRTVF9NT1VOVF9P
VkVSTEFZIHRvCj4gPiAobW91bnRfb3ZlcmxheShfX0ZJTEVfXywgX19MSU5FX18sIDApID09IDAp
Cj4gPiBzbyB0aGF0IGl0IGNvdWxkIGJlIHVzZWQgbGlrZSB0aGlzOgo+IAo+ID4gb3ZsX21vdW50
ZWQgPSBUU1RfTU9VTlRfT1ZFUkxBWSguLi4pCj4gKzEKPiAKPiA+IFVzZXMgb2YgU0FGRV9NT1VO
VF9PVkVSTEFZKCkgc2hvdWxkIG5vdCBjaGVjayByZXR1cm4gdmFsdWUKPiA+IGNvdWxkIGV2ZW4g
cGxhY2UgKHZvaWQpIGluIGZyb250IG9mIG1vdW50X292ZXJsYXkgdG8gZW5mb3JjZSB0aGF0Lgo+
IElmIHdlIGRvbid0IGNhcmUsIHRoZW4gaXQgY291bGQgYmU/Cj4gI2RlZmluZSBTQUZFX01PVU5U
X09WRVJMQVkoKSBcCj4gCSh2b2lkKSBtb3VudF9vdmVybGF5KF9fRklMRV9fLCBfX0xJTkVfXywg
MSk7Cj4gCj4gSSBtZWFuIHRoZXJlIGlzIGFsd2F5cyBtb3VudF9vdmVybGF5KCkgZm9yIHNwZWNp
YWwgY2FzZXMsIG1hY3JvcyBzaG91bGQgYmUKPiBoZXJlIHRvIG1ha2UgZWFzaWVyIGNvbW1vbiB1
c2FnZS4KPiAKPiA+IFRlc3QgdGhhdCB1c2UgU0FGRV9NT1VOVF9PVkVSTEFZKCkgc2hvdWxkIGVp
dGhlciBoYXZlIG5vCj4gPiB2YXJpYWJsZSBvdmxfbW91bnRlZCBvciBzZXQgaXQgYWZ0ZXIgU0FG
RV9NT1VOVF9PVkVSTEFZKCkgd2l0aG91dAo+ID4gY2hlY2tpbmcgcmV0dXJuIHZhbHVlLgo+ICsx
Cj4gCj4gPiBUaGFua3MsCj4gPiBBbWlyLgo+IAo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
