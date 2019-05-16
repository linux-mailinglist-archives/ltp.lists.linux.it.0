Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D952025C
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:15:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AA6F3EA383
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:15:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A313C3EA1AB
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:15:21 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 40FF72013C1
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:15:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95D00307D913;
 Thu, 16 May 2019 09:15:19 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F1665D9C3;
 Thu, 16 May 2019 09:15:18 +0000 (UTC)
Date: Thu, 16 May 2019 17:15:17 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190516091517.6c6gbgzkmf5vr6qz@XZHOUW.usersys.redhat.com>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510> <20190515134245.GC5429@dell5510>
 <CAOQ4uxhaSBiKY7nLNnbvpc7mpcnyOJ8Ecf3Es8n_VTPBRnfF7g@mail.gmail.com>
 <20190515182057.GA1856@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515182057.GA1856@x230>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 16 May 2019 09:15:19 +0000 (UTC)
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

SGkgQW1pciBhbmQgUGV0ciwKCk9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDA4OjIwOjU3UE0gKzAy
MDAsIFBldHIgVm9yZWwgd3JvdGU6Cj4gSGkgQW1pciwgTXVycGh5LAo+IAo+IAo+ID4gSSBsaWtl
ZCB5b3VyIGlkZWEgb2YgY3JlYXRlX292ZXJsYXlfZGlycy9tb3VudF9vdmVybGF5IGJldHRlci4K
PiA+IEl0IGlzIG1vcmUgZmxleGlibGUgZm9yIGZ1dHVyZSB0ZXN0cyB0aGF0IG1heSB3YW50IHRv
IHVtb3VudCBhbmQKPiA+IG1vdW50IG92ZXJsYXkgc2V2ZXJhbCB0aW1lcyBhbmQgdGhlIHNldHVw
IG9mIGxvd2VyL3VwcGVyIGZpbGVzCj4gPiBjb3VsZCBiZSB2ZXJ5IGRpZmZlcmVudCBpbiBmdXR1
cmUgdGVzdHMsIG5vdCBsaW1pdGVkIHRvIGp1c3QgY3JlYXRpbmcKPiA+IGZpbGVzIChtYXliZSBz
eW1saW5rcywgeGF0dHIpLgo+ID4gVGhlIGV4cGVyaWVuY2UgZnJvbSB4ZnN0ZXN0cyBvdmVybGF5
IHRlc3RzIHN1Z2dlc3RzIHRoYXQgdGhlCj4gPiBjcmVhdGVfb3ZlcmxheV9kaXJzL21vdW50X292
ZXJsYXkgaGVscGVycyBhcmUgYSBnb29kIG1vZGVsIHRvIGZvbGxvdy4KPiAKPiBUaGFua3MgZm9y
IGlkZWFzLCBhZ3JlZSB3aXRoIGl0Lgo+IAo+IE90aGVyIHRoaW5nIGlzIHRvIGhhdmUgY29uc3Qg
Y2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubyBhcyBmaXJzdCBwYXJhbWV0ZXJzCj4gZm9yIG1v
dW50X292ZXJsYXlfKCkgYW5kIGNyZWF0ZSBtb3VudF9vdmVybGF5KCkgYW5kIFNBRkVfTU9VTlRf
T1ZFUkxBWSgpIGFzIG1hY3JvcywKPiB3aGljaCB3b3VsZCB1c2UgaXQuIFNlZSB0c3RfbWtmc3tf
LH0oKSBhcyBleGFtcGxlcy4KClZlcnkgZ29vZCBzdWdnZXN0cyEgSSdsbCBkaWdnaW5nIGludG8g
aXQuCgpUaGFua3MsCk0KPiAKPiA+IFRoYW5rcywKPiA+IEFtaXIuCj4gCj4gS2luZCByZWdhcmRz
LAo+IFBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
