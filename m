Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1A2FEB9
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:00:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F8F73EA602
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 17:00:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6A6543EA11D
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:00:50 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D302320102A
 for <ltp@lists.linux.it>; Thu, 30 May 2019 17:00:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3110188E5D
 for <ltp@lists.linux.it>; Thu, 30 May 2019 15:00:46 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DE8C10027B6;
 Thu, 30 May 2019 15:00:45 +0000 (UTC)
Date: Thu, 30 May 2019 23:00:43 +0800
From: Murphy Zhou <xzhou@redhat.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190530150043.3vi3wytgs2z2y7y5@XZHOUW.usersys.redhat.com>
References: <20190530102336.10898-1-xzhou@redhat.com>
 <1564717500.25330071.1559212281463.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564717500.25330071.1559212281463.JavaMail.zimbra@redhat.com>
User-Agent: NeoMutt/20180716-1844-e630b3
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 30 May 2019 15:00:48 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDY6MzE6MjFBTSAtMDQwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gTGlrZSBhbGxfZmlsZXN5
c3RlbXMsIHNvbWVfZmlsZXN5c3RlbXMgb3B0aW9uIGxldCB0Y2FzZSB0byBydW4gb24KPiA+IHNw
ZWNpZmljIGZpbGVzeXN0ZW1zLgo+ID4gSW4gb3JkZXIgdG8gaW1wbGVtZW50IHRoaXMsIGNoYW5n
ZSBydW5fdGNhc2VzX3Blcl9mcyB0byBhY2NlcHQgYQo+ID4gcGFyYW1ldGVyIGluZGljYXRpbmcg
d2hpY2ggZmlsZXN5c3RlbXMgbmVlZCB0byB0ZXN0Lgo+ID4gCj4gPiBUbyBsZXQgdGNhc2UgdXNl
IHRoaXMgb3B0aW9uLCB3ZSBuZWVkIHNvbWUgb3RoZXIgZmxhZ3Mgc2V0Cj4gPiBFZzoKPiA+IHN0
YXRpYyBjaGFyICpzb21lX2ZpbGVzeXN0ZW1zW10gPSB7ImV4dDQiLCAieGZzIiwgImJ0cmZzIn07
Cj4gCj4gV2hhdCBoYXBwZW5zIGlmIG9uZSBvZiB0aGVtIGlzIG5vdCBzdXBwb3J0ZWQvYXZhaWxh
YmxlPwo+IFdpbGwgaXQgYmUgc2tpcHBlZC9UQ09ORj8KPiAKClZlcnkgZ29vZCBxdWVzdGlvbiEg
Tm93IGl0IGJyZWFrcyBUQ09ORiBpZiBub3QgYXZhaWxhYmxlIGJlY2F1c2UKYXZhaWxhYmlsaXR5
IGlzIG5vdCBjaGVja2VkIGxpa2UgYWxsX2ZpbGVzeXN0ZW1zIGNvbmZpZyBkb2VzLgpJdCdzIGJl
dHRlciB0byBhZGQgaXQuIElmIGl0J3Mgbm90IHN1cHBvcnRlZCwgd2Ugc2hvdWxkIG5vdCBsaXN0
Cml0IGluIHRoZSBmcyB0eXBlIGFycmF5LgoKVGhhbmtzLApNdXJwaHkKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
