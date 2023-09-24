Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A92B47ACC23
	for <lists+linux-ltp@lfdr.de>; Sun, 24 Sep 2023 23:56:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 558473CBDC6
	for <lists+linux-ltp@lfdr.de>; Sun, 24 Sep 2023 23:56:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 557A03CBDC6
 for <ltp@lists.linux.it>; Sun, 24 Sep 2023 23:56:48 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 14F9F1000776
 for <ltp@lists.linux.it>; Sun, 24 Sep 2023 23:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=t0dWRs0AcgJslUYwJm+3ICfi/SDNmg7iKfq/0Kh1WAc=; b=hj/JQqXGV4LZ1Z56d6uW9HOEmC
 h2nSL/RQeHQdmbLgcsXYyTTIhfVpUfzo0RSpfO8Qy/0NaJMG5mUjzTQXFsRcpa2iHCgFB2OxKpjrf
 mEnjzJQUAfWuhgE/E6fYv1IYmk5xyimJpfVJnJzRrj4la+FwJFrZSJqMqV3oLI29NO6Ed42pxpVxk
 RGtSU8OgA6Fdn0hlSTypKCnmQBXDzEnOZAXEzOuAopSjNtIVXQ4l+zFIHGWdPTxzwXIQ7RBLEm5GE
 YwZl9gqhnzKo36mTX6VfjbwharVBeq53EXWAJVI5OWxPQwVTk7qIf8XPDeed+smEANcyzcxih4nzL
 JlLG2VSQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qkX5Y-00FGVf-Mo; Sun, 24 Sep 2023 21:56:28 +0000
Date: Sun, 24 Sep 2023 22:56:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <ZRCwjGSF//WUPohL@casper.infradead.org>
References: <ZQ1Z_JHMPE3hrzv5@yuki>
 <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
 <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
 <ZQ75JynY8Y2DqaHD@casper.infradead.org>
 <CAOQ4uxjOGqWFdS4rU8u9TuLMLJafqMUsQUD3ToY3L9bOsfGibg@mail.gmail.com>
 <CAD_8n+SNKww4VwLRsBdOg+aBc7pNzZhmW9TPcj9472_MjGhWyg@mail.gmail.com>
 <CAOQ4uxjM8YTA9DjT5nYW1RBZReLjtLV6ZS3LNOOrgCRQcR2F9A@mail.gmail.com>
 <CAOQ4uxjmyfKmOxP0MZQPfu8PL3KjLeC=HwgEACo21MJg-6rD7g@mail.gmail.com>
 <ZRBHSACF5NdZoQwx@casper.infradead.org>
 <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjmoY_Pu_JiY9U1TAa=Tz1Mta3aH=wwn192GOfRuvLJQw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: mszeredi@redhat.com, brauner@kernel.org, Jan Kara <jack@suse.cz>,
 lkp@intel.com, oe-lkp@lists.linux.dev,
 kernel test robot <oliver.sang@intel.com>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, Reuben Hawkins <reubenhwk@gmail.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gU3VuLCBTZXAgMjQsIDIwMjMgYXQgMDY6MzI6MzBQTSArMDMwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gU3VuLCBTZXAgMjQsIDIwMjMgYXQgNToyN+KAr1BNIE1hdHRoZXcgV2lsY294
IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIFNlcCAyNCwgMjAy
MyBhdCAwMjo0Nzo0MlBNICswMzAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPiA+ID4gU2luY2Ug
eW91IGpvaW5lZCB0aGUgZGlzY3Vzc2lvbiwgeW91IGhhdmUgdGhlIG9wcG9ydHVuaXR5IHRvIGFn
cmVlIG9yCj4gPiA+IGRpc2FncmVlIHdpdGggb3VyIGRlY2lzaW9uIHRvIGNoYW5nZSByZWFkYWhl
YWQoKSB0byBFU1BJUEUuCj4gPiA+IEp1ZGdpbmcgIGJ5IHlvdXIgY2l0aW5nIG9mIGxzZWVrIGFu
ZCBwb3NpeF9mYWR2aXNlIHN0YW5kYXJkLAo+ID4gPiBJIGFzc3VtZSB0aGF0IHlvdSB3aWxsIGJl
IG9uIGJvYXJkPwo+ID4KPiA+IEknbSBmaW5lIHdpdGggcmV0dXJuaW5nIEVTUElQRSAoaXQncyBs
aWtlIEVOT1RUWSBpbiBhIHNlbnNlKS4gIGJ1dAo+ID4gdGhhdCdzIG5vdCB3aGF0IGtidWlsZCBy
ZXBvcnRlZDoKPiAKPiBrYnVpbGQgcmVwb3J0IGlzIGZyb20gdjEgcGF0Y2ggdGhhdCB3YXMgcG9z
dGVkIHRvIHRoZSBsaXN0Cj4gdGhpcyBpcyBub3QgdGhlIHBhdGNoICh2MikgdGhhdCBpcyBhcHBs
aWVkIHRvIHZmcy5taXNjCj4gYW5kIGhhcyBiZWVuIGluIGxpbnV4LW5leHQgZm9yIGEgZmV3IGRh
eXMuCgpBaCEgIEkgd2FzIGNvbmZ1c2VkLgoKPiA+IEkgdGhpbmsgdGhhdCBzaG91bGQKPiA+IGFs
c28gcmV0dXJuIEVTUElQRS4gIEkgdGhpbmsgcG9zaXhfZmFkdmlzZSgpIHNob3VsZCByZXR1cm4g
RVNQSVBFIG9uIGEKPiA+IHNvY2tldCB0b28sIGJ1dCByZXBvcnRpbmcgYnVncyB0byB0aGUgQXVz
dGluIEdyb3VwIHNlZW1zIHF1aXRlIHBhaW5mdWwuCj4gPiBQZXJoYXBzIHNvbWVib2R5IGhhcyBi
ZWVuIHRocm91Z2ggdGhpcyBwcm9jZXNzIGFuZCBjYW4gZG8gdGhhdCBmb3IgdXM/Cj4gCj4gVGhp
cyBpcyBSZXViZW4ncyBmaXJzdCBrZXJuZWwgcGF0Y2guCj4gTGV0J3MgYWdyZWUgdGhhdCBjaGFu
Z2luZyB0aGUgc3RhbmRhcmQgb2YgcG9zaXhfZmFkdmlzZSgpIGZvciBzb2NrZXQgaXMKPiBiZXlv
bmQgdGhlIHNjb3BlIG9mIGhpcyBjb250cmlidXRpb24gOikKClRoYW5rIHlvdSBmb3Igc2hlcGhl
cmRpbmcgaGlzIGZpcnN0IGNvbnRyaWJ1dGlvbi4gIFVuZm9ydHVuYXRlbHksIHRoaXMKaXMgcmF0
aGVyIHRoZSB3YXkgb2YgaXQgd2hlbiB5b3Ugc3RhcnQgdG8gcGljayBhdCBzb21ldGhpbmcgLi4u
IHlvdSBmaW5kCm1vcmUgdGhpbmdzIHRoYXQgYXJlIGJyb2tlbi4gIEl0J3MgcmF0aGVyIHVudXN1
YWwgdGhhdCB0aGlzIG9uZSB0dXJuZWQKb3V0IHRvIGJlICJUaGUgUE9TSVggc3BlYyBoYXMgYSBk
ZWZlY3QiIDstKQoKQnV0IHllcywgSSdtIGNvbnRlbnQgd2l0aCB2MiBpZiB2MiBkb2VzIGluIGZh
Y3QgcmV0dXJuIEVTUElQRSBmb3IKcmVhZGFoZWFkKCkgb24gYSBzb2NrZXQuICBMZXQncyB3YWl0
IHRvIGZpbmQgb3V0LiAgV2UgY2FuIGFkZHJlc3MgdGhlClBPU0lYIGRlZmVjdCBsYXRlci4KCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
