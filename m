Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 738151F9D8
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 20:21:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4836A3EA20A
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 20:21:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0C0393EA13F
 for <ltp@lists.linux.it>; Wed, 15 May 2019 20:21:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB0821400BEA
 for <ltp@lists.linux.it>; Wed, 15 May 2019 20:21:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8423CAECD;
 Wed, 15 May 2019 18:20:59 +0000 (UTC)
Date: Wed, 15 May 2019 20:20:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>, Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190515182057.GA1856@x230>
References: <20190503210005.GA18171@x230>
 <20190515092129.26336-1-xzhou@redhat.com>
 <20190515133102.GA5429@dell5510> <20190515134245.GC5429@dell5510>
 <CAOQ4uxhaSBiKY7nLNnbvpc7mpcnyOJ8Ecf3Es8n_VTPBRnfF7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhaSBiKY7nLNnbvpc7mpcnyOJ8Ecf3Es8n_VTPBRnfF7g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQW1pciwgTXVycGh5LAoKCj4gSSBsaWtlZCB5b3VyIGlkZWEgb2YgY3JlYXRlX292ZXJsYXlf
ZGlycy9tb3VudF9vdmVybGF5IGJldHRlci4KPiBJdCBpcyBtb3JlIGZsZXhpYmxlIGZvciBmdXR1
cmUgdGVzdHMgdGhhdCBtYXkgd2FudCB0byB1bW91bnQgYW5kCj4gbW91bnQgb3ZlcmxheSBzZXZl
cmFsIHRpbWVzIGFuZCB0aGUgc2V0dXAgb2YgbG93ZXIvdXBwZXIgZmlsZXMKPiBjb3VsZCBiZSB2
ZXJ5IGRpZmZlcmVudCBpbiBmdXR1cmUgdGVzdHMsIG5vdCBsaW1pdGVkIHRvIGp1c3QgY3JlYXRp
bmcKPiBmaWxlcyAobWF5YmUgc3ltbGlua3MsIHhhdHRyKS4KPiBUaGUgZXhwZXJpZW5jZSBmcm9t
IHhmc3Rlc3RzIG92ZXJsYXkgdGVzdHMgc3VnZ2VzdHMgdGhhdCB0aGUKPiBjcmVhdGVfb3Zlcmxh
eV9kaXJzL21vdW50X292ZXJsYXkgaGVscGVycyBhcmUgYSBnb29kIG1vZGVsIHRvIGZvbGxvdy4K
ClRoYW5rcyBmb3IgaWRlYXMsIGFncmVlIHdpdGggaXQuCgpPdGhlciB0aGluZyBpcyB0byBoYXZl
IGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBsaW5lbm8gYXMgZmlyc3QgcGFyYW1ldGVycwpm
b3IgbW91bnRfb3ZlcmxheV8oKSBhbmQgY3JlYXRlIG1vdW50X292ZXJsYXkoKSBhbmQgU0FGRV9N
T1VOVF9PVkVSTEFZKCkgYXMgbWFjcm9zLAp3aGljaCB3b3VsZCB1c2UgaXQuIFNlZSB0c3RfbWtm
c3tfLH0oKSBhcyBleGFtcGxlcy4KCj4gVGhhbmtzLAo+IEFtaXIuCgpLaW5kIHJlZ2FyZHMsClBl
dHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
