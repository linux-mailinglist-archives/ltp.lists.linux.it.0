Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 855C420255
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:14:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48CC93EA3C6
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 11:14:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 061663EA2DB
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:14:35 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 64685602201
 for <ltp@lists.linux.it>; Thu, 16 May 2019 11:14:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69D5A30C0DCF;
 Thu, 16 May 2019 09:14:32 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D96CF60BE5;
 Thu, 16 May 2019 09:14:31 +0000 (UTC)
Date: Thu, 16 May 2019 17:14:30 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190516091430.g2ewjubhurdzlnz4@XZHOUW.usersys.redhat.com>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515092129.26336-2-xzhou@redhat.com>
 <20190515133940.GB5429@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515133940.GB5429@dell5510>
User-Agent: NeoMutt/20180716-1400-f2a658
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 16 May 2019 09:14:32 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: liwan@redhat.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] OVL_MNT: put overlayfs lower, upper, work,
 mnt dir in a separated mountpoint
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDM6Mzk6NDBQTSArMDIwMCwgUGV0ciBWb3JlbCB3cm90
ZToKPiBIaSBNdXJwaHksCj4gCj4gPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2V4
ZWN2ZWF0L2V4ZWN2ZWF0MDMuYwo+IC4uLgo+ID4gLQkvKiBTZXR1cCBhbiBvdmVybGF5IG1vdW50
IHdpdGggbG93ZXIgZmlsZSAqLwo+ID4gLQlTQUZFX01LRElSKCJsb3dlciIsIDA3NTUpOwo+ID4g
LQlTQUZFX01LRElSKCJ1cHBlciIsIDA3NTUpOwo+ID4gLQlTQUZFX01LRElSKCJ3b3JrIiwgMDc1
NSk7Cj4gPiAtCVNBRkVfTUtESVIoT1ZMX01OVCwgMDc1NSk7Cj4gPiAtCXJldCA9IG1vdW50KCJv
dmVybGF5IiwgT1ZMX01OVCwgIm92ZXJsYXkiLCAwLAo+ID4gLQkJICAgICJsb3dlcmRpcj1sb3dl
cix1cHBlcmRpcj11cHBlcix3b3JrZGlyPXdvcmsiKTsKPiA+IC0JaWYgKHJldCA8IDApIHsKPiA+
IC0JCWlmIChlcnJubyA9PSBFTk9ERVYpIHsKPiA+IC0JCQl0c3RfYnJrKFRDT05GLAo+ID4gLQkJ
CQkib3ZlcmxheWZzIGlzIG5vdCBjb25maWd1cmVkIGluIHRoaXMga2VybmVsLiIpOwo+ID4gLQkJ
fQo+ID4gLQkJdHN0X2JyayhUQlJPSyB8IFRFUlJOTywgIm92ZXJsYXlmcyBtb3VudCBmYWlsZWQi
KTsKPiA+IC0JfQo+ID4gLQlvdmxfbW91bnRlZCA9IDE7Cj4gPiArCWlmIChzZXR1cF9vdmVybGF5
KDEpID09IDApCj4gPiArCQlvdmxfbW91bnRlZCA9IDE7Cj4gSGVyZSB5b3UgY2hhbmdlIHRlc3Qg
YmVoYXZpb3Igb24gRU5PREVWLgoKR3JlYXQgY2F0Y2ghIEkgbWlzc2VkIHRoaXMgd2hlbiBjb3B5
aW5nIHNldHVwX292ZXJsYXkgZnJvbSByZWFkYWhlYWQwMi4KaW5vdGlmeSB0ZXN0cyBhcmUgZGlm
ZmVyZW50IGZyb20gdGhpcy4KClRoYW5rcyEKbQoKPiAKPiArIG1vcmUgaW5mbyBhdCAxc3QgcGF0
Y2guCj4gCj4gS2luZCByZWdhcmRzLAo+IFBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
