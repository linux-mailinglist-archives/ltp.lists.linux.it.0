Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05B2B86E
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 17:36:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 428A33EA9C8
	for <lists+linux-ltp@lfdr.de>; Mon, 27 May 2019 17:36:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 80E4C3EA1DC
 for <ltp@lists.linux.it>; Mon, 27 May 2019 17:36:35 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D771F1000CE0
 for <ltp@lists.linux.it>; Mon, 27 May 2019 17:36:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82E8DAE99;
 Mon, 27 May 2019 15:36:34 +0000 (UTC)
Date: Mon, 27 May 2019 17:36:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <xzhou@redhat.com>
Message-ID: <20190527153632.GA20053@dell5510>
References: <20190524122357.GA28108@dell5510>
 <20190525115112.15399-1-xzhou@redhat.com>
 <20190527120945.GA25513@dell5510>
 <20190527133859.mun7h2xlzjdcwlqv@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527133859.mun7h2xlzjdcwlqv@XZHOUW.usersys.redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4 1/2] OVL_MNT: add helpers to setup overlayfs
	mountpoint
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

SGkgQW1pciwgTXVycGh5LAoKPiA+IFRPRE86Cj4gPiBJJ20gc3RpbGwgbm90IHN1cmUgYWJvdXQg
b3ZsX21vdW50ZWQuIFRoZXJlIGlzIHN0YXRpYyBpbnQgbW50cG9pbnRfbW91bnRlZCBpbgo+ID4g
bGliL3RzdF90ZXN0LmMsIHdoaWNoIGRvZXMgdW1vdW50LiAgdHN0X3Rlc3QtPm1udHBvaW50LCBJ
IGd1ZXNzIHdlIHNob3VsZCB1c2UKPiA+IGl0LiBXRFlUPwoKPiBtbnRwb2ludF9tb3VudGVkIGlz
IHRyYWNraW5nIG1vdW50IHN0YXR1cyBvZiBhIHNlcGFyYXRlZCBtb3VudHBvaW50IHdoaWNoCj4g
aXMgdGhlIGJhc2UgZm9yIGNyZWF0aW5nIG92ZXJsYXkgZGlycyBhbmQgb3ZlcmxheSBtb3VudHBv
aW50LiBUaGlzIHNlcGFyYXRlZAo+IG1vdW50cG9pbnQgaXMgc2V0dXAgZnJvbSBzY3JhdGNoLCBn
cmFiIGRldiwgbWZrcyBldGMuIEl0J3Mgc2VwYXJhdGVkIGZyb20KPiBydW5sdHAgLWQgRElSLiBU
aGlzIGlzIHdoeSB0aGlzIHBhdGNoIGlzIG5lZWRlZC4KCj4gT3ZlcmxheWZzIGlzIG1vdW50ZWQg
b24gdGhpcyBzZXBhcmF0ZWQgbW91bnRwb2ludC4gVGVzdGNhc2VzIG5lZWQgdG8gdW1vdW50Cj4g
b3ZlcmxheWZzIGluIGNsZWFudXAgaWYgc2V0dXAgb3ZlcmxheSBzdWNjZXNzZnVsbHkuIFRoYXQn
cyB3aHkgb3ZsX21vdW50ZWQKPiBpcyBuZWVkZWQuCgo+IEhvdyBhYm91dCBTQUZFX1VNT1VOVF9P
VkVSTEFZIGlnbm9yaW5nIEVJTlZBTCA/CkkgZG9uJ3Qgc2VlIG11Y2ggYmVuZWZpdHMsIHdoZW4g
d2UgaGF2ZSBTQUZFX1VNT1VOVCgpLiAgTW9yZSB1c2VmdWwgbG9va3MgdG8gbWUKZm9yIHNpbXBs
ZSBjYXNlcyBtb3ZlIG92bF9tb3VudGVkIGFuZCBTQUZFX1VNT1VOVChPVkxfTU5UKSAgdG8gbGli
cmFyeSAodGhlIG9ubHkKdGhpbmcgbmVlZGVkIHdvdWxkIGJlIHNvbWUgZmxhZyBmb3Igc3RydWN0
IHRzdF90ZXN0IGUuZy4gLm1vdW50X292ZXJsYXkgPSAxKS4KCj4gVGhhbmtzIQo+IE0KCgpLaW5k
IHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
