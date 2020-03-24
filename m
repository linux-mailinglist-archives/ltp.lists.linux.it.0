Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA17190CB7
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:47:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5575E3C4D2B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 12:47:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 732603C042A
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:47:34 +0100 (CET)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2FC451A0112B
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 12:47:32 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8C9EB712;
 Tue, 24 Mar 2020 07:47:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 24 Mar 2020 07:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=I
 Xm65KYZAxllVaPU5SpX440rZTHowCuyTMv9YYU3WX4=; b=cFCaubBvJMuOCgg2M
 zGpj4/5271lGmMw0UHkGL0h0FWGXfVe/or1KalJH6wgbKzmS52ua2kr5kBrpDqfs
 iRtlzfdWgFvtBNFC5GS0TCu4Jl9STdeMacd+vk9SUAO6S3or291o/DCyzePEDTp3
 mI6FsAguh6uLxTVpjhHWFhwUykDwHYa3A2AvwMCicZZnr4JXsQEhzxs/CK2rnzbM
 YDBSok5NcMCRTXANj1386RaATmNF0mh+gk0oQiridXbldCQLFlkYmaAJ3jPq+bOA
 H55zYcZN1mlFiMS494uCQ91JcEyzj59yqN7oL0oAW5SURC0iHkYFdTLvH2nEz1Ua
 gtwyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=IXm65KYZAxllVaPU5SpX440rZTHowCuyTMv9YYU3W
 X4=; b=M2eJZfhgAQAYUILJWj1cdmpDXjSLGfqo+tuf3UKiL9UaaI9ar1aw7Swtf
 BcLQHmjURSfnnzVGAlELb2QJMJjYos7gzYLjh+rQwJTCu3ukW3V77yU1tNLO538e
 /T+SMFhZXtm6N0bO/zbzydoDCLRneZlZ9rYq4eWs9+CjdySIqEr4lbWuOD04Nu6b
 6QMt+9/LbOGssMitSSgkne62dDpGGSspQd847NbkVNp+3SRQsRajW2VD8OOJ7pgN
 f7A9xb+MTbKBhsazjUVQMbKblUvFa1y6AVif7XeZJW0QswTerKoKlenH+BLHwyNg
 Rzoj0N1EKPXS3Zc18M0F8FsojWKuA==
X-ME-Sender: <xms:UfN5XlR5X0Qg4WxD52Ijx0wG5vjFRD0cZj2dGVwvaVLyVpgbjy652A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlh
 drohhrghdprghmrgiiohhnrgifshdrtghomhenucfkphepkeefrdekiedrkeelrddutdej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvg
 hgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:UfN5XjAWPTYyD_LhMtjp9oqN842r5Mc3j6zQqPtFHfSUmCjnEYWWaw>
 <xmx:UfN5Xl1_3M-b3QsT49CFJby0jfUmOZpenbOuuSO3_gVQkqkvAG5FGA>
 <xmx:UfN5XhXSCroLwcfQH45itWYYt6K_qw4Lt2EvYWz8e_js64R0KP4etA>
 <xmx:UvN5Xj5zcglY6wMQlgWD21fA4IesADyS0HhNcUAUO1Kwrhln7PieJg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 796423280063;
 Tue, 24 Mar 2020 07:47:29 -0400 (EDT)
Date: Tue, 24 Mar 2020 12:47:27 +0100
From: Greg KH <greg@kroah.com>
To: Veronika Kabatova <vkabatov@redhat.com>
Message-ID: <20200324114727.GA2333047@kroah.com>
References: <cki.936A32626F.M0L95JS69X@redhat.com>
 <20200324062213.GA1961100@kroah.com>
 <970614328.15180583.1585048327050.JavaMail.zimbra@redhat.com>
 <20200324111819.GA2234211@kroah.com>
 <1768018191.15186361.1585050272846.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1768018191.15186361.1585050272846.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?8J+SpSBQQU5JQ0tFRDogVGVzdCByZXBvcnQ/Zm9yP2tlcm5l?=
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

T24gVHVlLCBNYXIgMjQsIDIwMjAgYXQgMDc6NDQ6MzJBTSAtMDQwMCwgVmVyb25pa2EgS2FiYXRv
dmEgd3JvdGU6Cj4gCj4gCj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gRnJvbTog
IkdyZWcgS0giIDxncmVnQGtyb2FoLmNvbT4KPiA+IFRvOiAiVmVyb25pa2EgS2FiYXRvdmEiIDx2
a2FiYXRvdkByZWRoYXQuY29tPgo+ID4gQ2M6ICJNZW1vcnkgTWFuYWdlbWVudCIgPG1tLXFlQHJl
ZGhhdC5jb20+LCAiT25kcmVqIE1vc25hY2VrIiA8b21vc25hY2VAcmVkaGF0LmNvbT4sICJMaW51
eCBTdGFibGUgbWFpbGxpc3QiCj4gPiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJDS0kgUHJv
amVjdCIgPGNraS1wcm9qZWN0QHJlZGhhdC5jb20+LCAiSmFuIFN0YW5jZWsiIDxqc3RhbmNla0By
ZWRoYXQuY29tPiwgIkxUUCBNYWlsaW5nCj4gPiBMaXN0IiA8bHRwQGxpc3RzLmxpbnV4Lml0Pgo+
ID4gU2VudDogVHVlc2RheSwgTWFyY2ggMjQsIDIwMjAgMTI6MTg6MTkgUE0KPiA+IFN1YmplY3Q6
IFJlOiDwn5KlIFBBTklDS0VEOiBUZXN0IHJlcG9ydAlmb3I/a2VybmVsIDUuNS4xMi1yYzEtOGI4
NDFlYi5ja2kgKHN0YWJsZSkKPiA+IAo+ID4gT24gVHVlLCBNYXIgMjQsIDIwMjAgYXQgMDc6MTI6
MDdBTSAtMDQwMCwgVmVyb25pa2EgS2FiYXRvdmEgd3JvdGU6Cj4gPiA+IAo+ID4gPiAKPiA+ID4g
LS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gPiA+IEZyb206ICJHcmVnIEtIIiA8Z3Jl
Z0Brcm9haC5jb20+Cj4gPiA+ID4gVG86ICJDS0kgUHJvamVjdCIgPGNraS1wcm9qZWN0QHJlZGhh
dC5jb20+Cj4gPiA+ID4gQ2M6ICJNZW1vcnkgTWFuYWdlbWVudCIgPG1tLXFlQHJlZGhhdC5jb20+
LCAiT25kcmVqIE1vc25hY2VrIgo+ID4gPiA+IDxvbW9zbmFjZUByZWRoYXQuY29tPiwgIkxpbnV4
IFN0YWJsZSBtYWlsbGlzdCIKPiA+ID4gPiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJKYW4g
U3RhbmNlayIgPGpzdGFuY2VrQHJlZGhhdC5jb20+LCAiTFRQCj4gPiA+ID4gTWFpbGluZyBMaXN0
IiA8bHRwQGxpc3RzLmxpbnV4Lml0Pgo+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI0LCAy
MDIwIDc6MjI6MTMgQU0KPiA+ID4gPiBTdWJqZWN0OiBSZTog8J+SpSBQQU5JQ0tFRDogVGVzdCBy
ZXBvcnQgZm9yCWtlcm5lbCA1LjUuMTItcmMxLThiODQxZWIuY2tpCj4gPiA+ID4gKHN0YWJsZSkK
PiA+ID4gPiAKPiA+ID4gPiBPbiBUdWUsIE1hciAyNCwgMjAyMCBhdCAwNTo0MjozOEFNIC0wMDAw
LCBDS0kgUHJvamVjdCB3cm90ZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSByZWNlbnQgY29tbWl0IGZy
b20gdGhpcyBrZXJuZWwgdHJlZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgICAgIEtlcm5lbCBy
ZXBvOgo+ID4gPiA+ID4gICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gPiA+ID4gPiAgICAgICAg
ICAgICBDb21taXQ6IDhiODQxZWI2OTdlMSAtIExpbnV4IDUuNS4xMi1yYzEKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRl
ZCBiZWxvdy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQg
KHNlZSBkZXRhaWxzIGJlbG93KQo+ID4gPiA+ID4gICAgICAgICAgICAgIE1lcmdlOiBPSwo+ID4g
PiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+ID4gPiA+ID4gICAgICAgICAgICAgIFRlc3Rz
OiBQQU5JQ0tFRAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25m
aWcgZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkCj4gPiA+ID4gPiBo
ZXJlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgIGh0dHBzOi8vY2tpLWFydGlmYWN0cy5zMy51cy1l
YXN0LTIuYW1hem9uYXdzLmNvbS9pbmRleC5odG1sP3ByZWZpeD1kYXRhd2FyZWhvdXNlLzIwMjAv
MDMvMjMvNTAyMDM5Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0
cyBmYWlsZWQ6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAgICBwcGM2NGxlOgo+ID4gPiA+ID4gICAg
ICDwn5KlIHhmc3Rlc3RzIC0gZXh0NAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgICAgYWFyY2g2NDoK
PiA+ID4gPiA+ICAgICAg4p2MIExUUAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgICAgeDg2XzY0Ogo+
ID4gPiA+ID4gICAgICDwn5KlIHhmc3Rlc3RzIC0gZXh0NAo+ID4gPiA+IAo+ID4gPiA+IE9rLCBp
dCdzIHRpbWUgSSBzdGFydCBqdXN0IGJsYWNrbGlzdGluZyB0aGlzIHJlcG9ydCBhZ2FpbiwgaXQn
cyBub3QKPiA+ID4gPiBiZWluZyBoZWxwZnVsIGluIGFueSB3YXkgOigKPiA+ID4gPiAKPiA+ID4g
PiBSZW1lbWJlciwgaWYgc29tZXRoaW5nIHN0YXJ0cyBicmVha2luZywgSSBuZWVkIHNvbWUgd2F5
IHRvIGZpbmQgb3V0IHdoYXQKPiA+ID4gPiBjYXVzZWQgaXQgdG8gYnJlYWsuLi4KPiA+ID4gPiAK
PiA+ID4gCj4gPiA+IEhpIEdyZWcsCj4gPiA+IAo+ID4gPiBkbyB5b3UgaGF2ZSBhbnkgc3BlY2lm
aWMgc3VnZ2VzdGlvbnMgYWJvdXQgd2hhdCB0byBpbmNsdWRlIHRvIGhlbHAgeW91IG91dD8KPiA+
ID4gVGhlIGxpbmtlZCBjb25zb2xlIGxvZ3MgY29udGFpbiBjYWxsIHRyYWNlcyBmb3IgdGhlIHBh
bmljcyBbMF0uIElzIHRoZXJlCj4gPiA+IGFueXRoaW5nIGVsc2UgdGhhdCB3b3VsZCBoZWxwIHlv
dSB3aXRoIGRlYnVnZ2luZyB0aG9zZT8gV2UncmUgcGxhbm5pbmcgb24KPiA+ID4gcmVsZWFzaW5n
IGNvcmUgZHVtcHMsIHdvdWxkIHRob3NlIGJlIGhlbHBmdWw/Cj4gPiAKPiA+IEJpc2VjdGlvbiB0
byBmaW5kIHRoZSBvZmZlbmRpbmcgY29tbWl0IHdvdWxkIGJlIGJlc3QuCj4gPiAKPiAKPiBUaGlz
IGlzIGdvaW5nIHRvIGJlIHJlYWxseSB0cmlja3kgZm9yIGhhcmQgdG8gcmVwcm9kdWNlIGJ1Z3Mg
YnV0IHdlJ2xsIGRvCj4gc29tZSByZXNlYXJjaCBvbiBpdCwgdGhhbmtzIQoKSSBnb3QgYWJvdXQg
OCAiZmFpbGVkIiBlbWFpbHMgdG9kYXksIGl0IGRvZXNuJ3Qgc291bmQgbGlrZSBpdCBpcyBoYXJk
IHRvCnJlcHJvZHVjZS4KCkFuZCBpZiB5b3UgY2FuJ3QgcmVwcm9kdWNlIGl0LCB3aHkgd291bGQg
eW91IGV4cGVjdCBtZSB0byBrbm93IHdoYXQgaXMKZ29pbmcgb24/ICA6KQoKdGhhbmtzLAoKZ3Jl
ZyBrLWgKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
