Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98044190C43
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:18:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D30223C4D2F
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:18:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 68F2C3C08C9
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:18:28 +0100 (CET)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 59FBC6017F3
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:18:25 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id DEBCE478;
 Tue, 24 Mar 2020 07:18:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 24 Mar 2020 07:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=b
 YpuqIL/AtkoWotmoAVC3A6mVQ1cLQ31lCsa2WiArr4=; b=mtZxASndeR07nUt2G
 qQFEmXhQDJXx/igyrlJJg+iF/QCIpC9EGGXpGINC6dEtn+eV0xWzpmN067pfV4g7
 fRaTR+3LasA2WtmyZlC99kWmVjk868mboKulm5hP4VNfEaCB68ufBeylAB1d1uXC
 re63oim93C8/qX7u9T5a0Iw7zruI4On2Ll18hoWShFED7Vu2FPf0zknLlLJFyp0J
 +sWWsujjc+KSYDhYfFIM2jAitFgEacv+y55XKR6LW9yogjutqfTlku+iyMqKF2ss
 f+V/bb8OEyvPm340zUHz2/Pe8ICUvIjK9ltz55Qre+1eItH+i9B3RNGK2Pc8Ab6v
 RpqEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=bYpuqIL/AtkoWotmoAVC3A6mVQ1cLQ31lCsa2WiAr
 r4=; b=rKmCo4RgKckXzDhMBlEsZ6VZduDUdr7N+HjWFAmDJGfkTIDjMOka1YNqz
 3VIOAa46QK2uPz4HlA0brDmwl19cpyUlYzc11/s3KFIwuIGTEB1bfMXbZWlzyN6U
 QkNdCzR2nGQbs3pvdlwOXh/BQtV6AwnV3xJr5jdr8aX2Phgl9CSKhbC90WSb6xC1
 ceDFqRt1TN1Y2ZH7V7avhFKeXyWyGdcnHExuPL53Te+L8clQNm6TdgXHWKQOVkMg
 zgQsImrW6Io3tHkTsI+EIQ4o4Aa0FlfUYEm29W2zPrYHGYFqodbGbcySZewEkIaA
 0p7KebUmFzoqICLvi66j7oLFfRNEw==
X-ME-Sender: <xms:fex5Xjr5KLkzhMjc9W5w-G8T1MYuXki93HqkZArFCcPMzHnJCJhPbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehtddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlh
 drohhrghdprghmrgiiohhnrgifshdrtghomhenucfkphepkeefrdekiedrkeelrddutdej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvg
 hgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:fex5XiFIsQcfm-21Wye2laRPqVfHsXf2cjydaGlL2tUteboItrPO7A>
 <xmx:fex5Xrhw7oXqj5I3k9_-wfEss2E2R2t7Gabp62U8NDqt7tMgQXU7Ng>
 <xmx:fex5XkP6D5xbyQggZQrBd4qkm2j6phNsbYiCMbyFiDZ23U_SnKn0NA>
 <xmx:fux5Xru4qcW-OBt536bcKrFQDB-IN49UxvUr5BRvxmPaK8uQF9mU3w>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8AF363280060;
 Tue, 24 Mar 2020 07:18:21 -0400 (EDT)
Date: Tue, 24 Mar 2020 12:18:19 +0100
From: Greg KH <greg@kroah.com>
To: Veronika Kabatova <vkabatov@redhat.com>
Message-ID: <20200324111819.GA2234211@kroah.com>
References: <cki.936A32626F.M0L95JS69X@redhat.com>
 <20200324062213.GA1961100@kroah.com>
 <970614328.15180583.1585048327050.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <970614328.15180583.1585048327050.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=F0=9F=92=A5_PANICKED=3A_Test_report_for=3Fkerne?=
 =?utf-8?q?l_5=2E5=2E12-rc1-8b841eb=2Ecki_=28stable=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBNYXIgMjQsIDIwMjAgYXQgMDc6MTI6MDdBTSAtMDQwMCwgVmVyb25pa2EgS2FiYXRv
dmEgd3JvdGU6Cj4gCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gRnJvbTog
IkdyZWcgS0giIDxncmVnQGtyb2FoLmNvbT4KPiA+IFRvOiAiQ0tJIFByb2plY3QiIDxja2ktcHJv
amVjdEByZWRoYXQuY29tPgo+ID4gQ2M6ICJNZW1vcnkgTWFuYWdlbWVudCIgPG1tLXFlQHJlZGhh
dC5jb20+LCAiT25kcmVqIE1vc25hY2VrIiA8b21vc25hY2VAcmVkaGF0LmNvbT4sICJMaW51eCBT
dGFibGUgbWFpbGxpc3QiCj4gPiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJKYW4gU3RhbmNl
ayIgPGpzdGFuY2VrQHJlZGhhdC5jb20+LCAiTFRQIE1haWxpbmcgTGlzdCIgPGx0cEBsaXN0cy5s
aW51eC5pdD4KPiA+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI0LCAyMDIwIDc6MjI6MTMgQU0KPiA+
IFN1YmplY3Q6IFJlOiDwn5KlIFBBTklDS0VEOiBUZXN0IHJlcG9ydCBmb3IJa2VybmVsIDUuNS4x
Mi1yYzEtOGI4NDFlYi5ja2kgKHN0YWJsZSkKPiA+IAo+ID4gT24gVHVlLCBNYXIgMjQsIDIwMjAg
YXQgMDU6NDI6MzhBTSAtMDAwMCwgQ0tJIFByb2plY3Qgd3JvdGU6Cj4gPiA+IAo+ID4gPiBIZWxs
bywKPiA+ID4gCj4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQgY29tbWl0
IGZyb20gdGhpcyBrZXJuZWwgdHJlZToKPiA+ID4gCj4gPiA+ICAgICAgICBLZXJuZWwgcmVwbzoK
PiA+ID4gICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gPiA+ICAgICAgICAgICAgIENvbW1pdDog
OGI4NDFlYjY5N2UxIC0gTGludXggNS41LjEyLXJjMQo+ID4gPiAKPiA+ID4gVGhlIHJlc3VsdHMg
b2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KPiA+ID4gCj4gPiA+
ICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+ID4gICAg
ICAgICAgICAgIE1lcmdlOiBPSwo+ID4gPiAgICAgICAgICAgIENvbXBpbGU6IE9LCj4gPiA+ICAg
ICAgICAgICAgICBUZXN0czogUEFOSUNLRUQKPiA+ID4gCj4gPiA+IEFsbCBrZXJuZWwgYmluYXJp
ZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQKPiA+
ID4gaGVyZToKPiA+ID4gCj4gPiA+ICAgaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3Qt
Mi5hbWF6b25hd3MuY29tL2luZGV4Lmh0bWw/cHJlZml4PWRhdGF3YXJlaG91c2UvMjAyMC8wMy8y
My81MDIwMzkKPiA+ID4gCj4gPiA+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBmYWlsZWQ6Cj4g
PiA+IAo+ID4gPiAgICAgcHBjNjRsZToKPiA+ID4gICAgICDwn5KlIHhmc3Rlc3RzIC0gZXh0NAo+
ID4gPiAKPiA+ID4gICAgIGFhcmNoNjQ6Cj4gPiA+ICAgICAg4p2MIExUUAo+ID4gPiAKPiA+ID4g
ICAgIHg4Nl82NDoKPiA+ID4gICAgICDwn5KlIHhmc3Rlc3RzIC0gZXh0NAo+ID4gCj4gPiBPaywg
aXQncyB0aW1lIEkgc3RhcnQganVzdCBibGFja2xpc3RpbmcgdGhpcyByZXBvcnQgYWdhaW4sIGl0
J3Mgbm90Cj4gPiBiZWluZyBoZWxwZnVsIGluIGFueSB3YXkgOigKPiA+IAo+ID4gUmVtZW1iZXIs
IGlmIHNvbWV0aGluZyBzdGFydHMgYnJlYWtpbmcsIEkgbmVlZCBzb21lIHdheSB0byBmaW5kIG91
dCB3aGF0Cj4gPiBjYXVzZWQgaXQgdG8gYnJlYWsuLi4KPiA+IAo+IAo+IEhpIEdyZWcsCj4gCj4g
ZG8geW91IGhhdmUgYW55IHNwZWNpZmljIHN1Z2dlc3Rpb25zIGFib3V0IHdoYXQgdG8gaW5jbHVk
ZSB0byBoZWxwIHlvdSBvdXQ/Cj4gVGhlIGxpbmtlZCBjb25zb2xlIGxvZ3MgY29udGFpbiBjYWxs
IHRyYWNlcyBmb3IgdGhlIHBhbmljcyBbMF0uIElzIHRoZXJlCj4gYW55dGhpbmcgZWxzZSB0aGF0
IHdvdWxkIGhlbHAgeW91IHdpdGggZGVidWdnaW5nIHRob3NlPyBXZSdyZSBwbGFubmluZyBvbgo+
IHJlbGVhc2luZyBjb3JlIGR1bXBzLCB3b3VsZCB0aG9zZSBiZSBoZWxwZnVsPwoKQmlzZWN0aW9u
IHRvIGZpbmQgdGhlIG9mZmVuZGluZyBjb21taXQgd291bGQgYmUgYmVzdC4KCnRoYW5rcywKCmdy
ZWcgay1oCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
