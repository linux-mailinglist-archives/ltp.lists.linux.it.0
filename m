Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B235FD0
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 17:02:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80AB73EA6A6
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 17:02:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2E8B53EA686
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 17:02:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1E728200D51
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 17:02:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C502AE08;
 Wed,  5 Jun 2019 15:02:50 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:02:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190605150248.GA25885@x230>
References: <20190605072126.19856-1-pvorel@suse.cz>
 <20190605072126.19856-2-pvorel@suse.cz>
 <CAEemH2doAQ7=b-zutgHnY469rz-JThw0E_3b4o79zx+n2-uX_A@mail.gmail.com>
 <20190605141613.GA3965@dell5510>
 <CAEemH2fLHFmNL57Hm5oU8MNoUN72brqz7fO-fOY_GGTxrAEpPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fLHFmNL57Hm5oU8MNoUN72brqz7fO-fOY_GGTxrAEpPQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 2/2] inotify: Add SAFE_MYINOTIFY_ADD_WATCH() helper
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

SGkgTGksCgo+IFlvdSBhcmUgcmlnaHQuIEFuZCBzZWVtcyB0aGUgcHJvYmxlbSBpcyBvbmx5IGV4
aXN0IGluIG9yaWdpbmFsIGNvZGUsIGl0IHB1dAo+IHJlYXBfd2QgaW4gd3JvbmcgcGxhY2UgYW5k
IG1pc2xlYWQgbXkgc2lnaHQuCgo+ICAgICAgICBpZiAoKHdkID0gbXlpbm90aWZ5X2FkZF93YXRj
aChmZF9ub3RpZnksIERJUl9QQVRILCBJTl9BTExfRVZFTlRTKSkgPAo+IDApIHsKPiAgICAgICAg
ICAgICAgICB0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
Imlub3RpZnlfYWRkX3dhdGNoICglZCwgIiBESVJfUEFUSCAiLCBJTl9BTExfRVZFTlRTKQo+IGZh
aWxlZCIsCj4gICAgICAgICAgICAgICAgICAgICAgICBmZF9ub3RpZnkpOwo+ICAgICAgICAgICAg
ICAgIHJlYXBfd2QgPSAxOwo+ICAgICAgICB9OwpUaGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4g
SSB3YXMgc3VycHJpc2VkIHdoeSB0aGlzIGlzIHRoZXJlLgpJJ2xsIG5vdGUgaXQgaW4gZ2l0IGNv
bW1pdC4KCi4uLgo+IFlvdSBwYXRjaCBzZXQgbG9va3MgZ29vZC4KCj4gU29ycnkgZm9yIHRoZSBl
cnJvciBpbiBqdWRnbWVudCwgdGhhdCByZW1pbmQgbWUgaXQncyB0aW1lIHRvIGdvIHRvIGJlZAo+
IG5vdzopLgpSZWFsbHksIHRoYW5rcyBhIGxvdCBmb3IgYSByZXZpZXchIChJJ2xsIGFkZCB5b3Vy
IGFjaykuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
