Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C12FEC8
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:02:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F0EE3EA2E7
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:02:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F41033EA11D
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:02:39 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C379560083D
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:02:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA6D230020D3;
 Thu, 30 May 2019 15:02:37 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4292F34914;
 Thu, 30 May 2019 15:02:36 +0000 (UTC)
Date: Thu, 30 May 2019 23:02:35 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190530150235.yulxh7i7vsjtvgmx@XZHOUW.usersys.redhat.com>
References: <20190530102336.10898-1-xzhou@redhat.com>
 <20190530105140.GB31468@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530105140.GB31468@rei.lan>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 30 May 2019 15:02:37 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_test: introduce
	tst_test->some_filesystems
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

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMTI6NTE6NDBQTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+ID4gTGlrZSBhbGxfZmlsZXN5c3RlbXMsIHNvbWVfZmlsZXN5c3RlbXMgb3B0
aW9uIGxldCB0Y2FzZSB0byBydW4gb24KPiA+IHNwZWNpZmljIGZpbGVzeXN0ZW1zLgo+ID4gSW4g
b3JkZXIgdG8gaW1wbGVtZW50IHRoaXMsIGNoYW5nZSBydW5fdGNhc2VzX3Blcl9mcyB0byBhY2Nl
cHQgYQo+ID4gcGFyYW1ldGVyIGluZGljYXRpbmcgd2hpY2ggZmlsZXN5c3RlbXMgbmVlZCB0byB0
ZXN0Lgo+ID4gCj4gPiBUbyBsZXQgdGNhc2UgdXNlIHRoaXMgb3B0aW9uLCB3ZSBuZWVkIHNvbWUg
b3RoZXIgZmxhZ3Mgc2V0Cj4gPiBFZzoKPiA+IHN0YXRpYyBjaGFyICpzb21lX2ZpbGVzeXN0ZW1z
W10gPSB7ImV4dDQiLCAieGZzIiwgImJ0cmZzIn07Cj4gPiAKPiA+ICAgLm1vdW50X2RldmljZSA9
IDAsCj4gPiAgIC5uZWVkc19kZXZpY2UgPSAxLAo+ID4gICAuZm9ybWF0X2RldmljZSA9IDEsCj4g
PiAgIC5tbnRwb2ludCA9IE1OVFBPSU5ULAo+ID4gICAuc29tZV9maWxlc3lzdGVtcyA9IHNvbWVf
ZmlsZXN5c3RlbXMsCj4gCj4gQ2FuJ3Qgd2UganVzdCBjaGFuZ2UgdGhlIGRldl9mc190eXBlIHRv
IGRldl9mc190eXBlcyBhcnJheSBpbnN0ZWFkPwoKU3VyZS4gVGhhdCdzIGEgbXVjaCBiZXR0ZXIg
bmFtZSEgTXkgbmFtaW5nIHRhc3RlIG5lZWRzIG11Y2ggaW1wcm92ZW1lbnQuLi4KClRoYW5rcyEK
Cj4gCj4gLS0gCj4gQ3lyaWwgSHJ1YmlzCj4gY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
