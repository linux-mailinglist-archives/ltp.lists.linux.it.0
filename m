Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C21058D6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 18:53:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F7553C22DA
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 18:53:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 027963C1C93
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 18:53:33 +0100 (CET)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7B0081BBBCBD
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 18:53:30 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7890422469;
 Thu, 21 Nov 2019 12:53:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Nov 2019 12:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=N
 AEmnfDLUP/DueEFDmZwyPS9pgpcvLGf7F8mdIJ+CW8=; b=N/xl9Rk0DX4YmymoC
 M1WmbMjb/MCBgevGg83zIRoVFnfpWyev4GR4CYEcViVXUL8Dmi6pqmmPo8jxuhfk
 gM4GfeLEk6s+4G2MGxV+UtgSMVQUJeft6w0SgQV46BbQz0z/I9adJG68Nn7wLJzd
 Ew+c4CFAbf7LgopwwFdF+LzKQMFHU7/z1XinoyMVNCyDLsWG1uelGQLrhHaB/MED
 t/X5sqUxVYLpvXPlmsNFLo7qojuMkee3tzH+CXNeFrU5JvFHJVksEY77vRRQtA2A
 VY/qTp5Cg7kiZ7HWgSVtUlLjXkKj2jAOk1th693kobV5DvGb0I9h+cn1SyN53703
 msSQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=NAEmnfDLUP/DueEFDmZwyPS9pgpcvLGf7F8mdIJ+C
 W8=; b=wuPr5a+zJiOf26soMbNgboPO9sYPzmhckI2n2AH9oUGzLCPnoYWsoQeR7
 NNNW+joDGHFXXa4AehC5L5s1axd9vhFyqQ+ds4Ar+k3PP3qXCEvyqGmt2tRyAp1F
 uDdakDi+FNI88RVvlEwJAMWBtk86RSohs9q2MRvEtkgZtUWdxsg59SnJ9JwQw9Ku
 lycKyUGN9D1SYUXIRAaa3UUXHr/P8ytHB4ucGbmC8EtUw1lXgdCVZIoJzhB2ZNuz
 8GO3uNzJbGfHMn5aJ/oUfUqHlyjAlfTz8LLAQ3Sxby3F2UAr5M53nVzfiF8ahEvs
 9PMtkQnoNnAbbezVit5lNKt7E2X9w==
X-ME-Sender: <xms:F8_WXd7zzekFpbXl90hV9cD45aetyQVPlQylgOQCA-chMR9pS4mteQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehvddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomhepifhr
 vghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpegtkhhiqd
 hprhhojhgvtghtrdhorhhgpdhrvgguhhgrthdrtghomhdpkhgvrhhnvghlrdhorhhgnecu
 kfhppedvudejrdeikedrgeelrdejvdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvg
 hgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:F8_WXQGR8hodcutKRKtu7SDk-DxDUkHNzbqN7DoXWRP0i2hYn0HbwQ>
 <xmx:F8_WXX0r5RGXZ1UfCJ0NwbMLtQxsWwnF0LZY8p4rATLiR4NaszMHvw>
 <xmx:F8_WXVoRAJ-CwJhP42A81RivCKgaxO5amqF5Sp1SdYY2B4pv_Khr1g>
 <xmx:GM_WXdolWo8RnOXZFAfmEChuRaqgiF4tplcCwep2gZftHIDVU8qPJw>
Received: from localhost (unknown [217.68.49.72])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4150F3060060;
 Thu, 21 Nov 2019 12:53:27 -0500 (EST)
Date: Thu, 21 Nov 2019 18:53:26 +0100
From: Greg KH <greg@kroah.com>
To: Laura Abbott <labbott@redhat.com>
Message-ID: <20191121175326.GB766491@kroah.com>
References: <cki.042792963E.5VOWULC1Q9@redhat.com>
 <8e0fa6de-b6b1-23ac-9e77-d425c8d1ba22@redhat.com>
 <c326c35e-453e-2dae-391c-5324803e6112@redhat.com>
 <20191119124428.GC1975017@kroah.com>
 <236c4f8d-a54e-daa6-0896-eca236e23e58@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <236c4f8d-a54e-daa6-0896-eca236e23e58@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] =?utf-8?b?4p2MIEZBSUw6IFN0YWJsZSBxdWV1ZTogcXVldWUtNS4z?=
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
Cc: Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDc6NTA6NTZBTSAtMDUwMCwgTGF1cmEgQWJib3R0IHdy
b3RlOgo+IE9uIDExLzE5LzE5IDc6NDQgQU0sIEdyZWcgS0ggd3JvdGU6Cj4gPiBPbiBUdWUsIE5v
diAxOSwgMjAxOSBhdCAwNzozNzowOUFNIC0wNTAwLCBMYXVyYSBBYmJvdHQgd3JvdGU6Cj4gPiA+
IE9uIDExLzE4LzE5IDc6MDcgUE0sIFJhY2hlbCBTaWJsZXkgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+
ID4gT24gMTEvMTgvMTkgMTA6MDAgQU0sIENLSSBQcm9qZWN0IHdyb3RlOgo+ID4gPiA+ID4gSGVs
bG8sCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdlIHJhbiBhdXRvbWF0ZWQgdGVzdHMgb24gYSBwYXRj
aHNldCB0aGF0IHdhcyBwcm9wb3NlZCBmb3IgbWVyZ2luZyBpbnRvIHRoaXMKPiA+ID4gPiA+IGtl
cm5lbCB0cmVlLiBUaGUgcGF0Y2hlcyB3ZXJlIGFwcGxpZWQgdG86Cj4gPiA+ID4gPiAKPiA+ID4g
PiA+ICAgICAgICAgIEtlcm5lbCByZXBvOmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQKPiA+ID4gPiA+ICAgICAgICAgICAgICAg
Q29tbWl0OiAxMTZhMzk1YjcwNjEgLSBMaW51eCA1LjMuMTEKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
VGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gICAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRl
dGFpbHMgYmVsb3cpCj4gPiA+ID4gPiAgICAgICAgICAgICAgICBNZXJnZTogT0sKPiA+ID4gPiA+
ICAgICAgICAgICAgICBDb21waWxlOiBPSwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgVGVzdHM6
IEZBSUxFRAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcg
ZmlsZXMsIGFuZCBsb2dzIGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4gPiA+ID4g
PiAKPiA+ID4gPiA+ICAgICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxp
bmVzLzI5MzA2Mwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPbmUgb3IgbW9yZSBrZXJuZWwgdGVzdHMg
ZmFpbGVkOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgICAgICBhYXJjaDY0Ogo+ID4gPiA+ID4gICAg
ICAgIOKdjCBMVFAgbGl0ZQo+ID4gPiA+IAo+ID4gPiA+IEkgc2VlIGEgcGFuaWMgd2hlbiBpbnN0
YWxsaW5nIHRoZSBMVFAgZGVwZW5kZW5jaWVzCj4gPiA+ID4gCj4gPiA+ID4gWyAgNjkwLjYyNTA2
MF0gQ2FsbCB0cmFjZToKPiA+ID4gPiBbICA2OTAuNjI3NDk1XSAgYmZxX2ZpbmRfc2V0X2dyb3Vw
KzB4OGMvMHhmMAo+ID4gPiA+IFsgIDY5MC42MzE0OTFdICBiZnFfYmljX3VwZGF0ZV9jZ3JvdXAr
MHhiYy8weDIxOAo+ID4gPiA+IFsgIDY5MC42MzU4MzRdICBiZnFfaW5pdF9ycSsweGFjLzB4ODA4
Cj4gPiA+ID4gWyAgNjkwLjYzOTMwOV0gIGJmcV9pbnNlcnRfcmVxdWVzdC5pc3JhLjArMHhlMC8w
eDIwMAo+ID4gPiA+IFsgIDY5MC42NDM5OTldICBiZnFfaW5zZXJ0X3JlcXVlc3RzKzB4NjgvMHg4
OAo+ID4gPiA+IFsgIDY5MC42NDgwODVdICBibGtfbXFfc2NoZWRfaW5zZXJ0X3JlcXVlc3RzKzB4
ODQvMHgxNDAKPiA+ID4gPiBbICA2OTAuNjUzMDM2XSAgYmxrX21xX2ZsdXNoX3BsdWdfbGlzdCsw
eDE3MC8weDJiMAo+ID4gPiA+IFsgIDY5MC42NTc1NTVdICBibGtfZmx1c2hfcGx1Z19saXN0KzB4
ZWMvMHgxMDAKPiA+ID4gPiBbICA2OTAuNjYxNzI1XSAgYmxrX21xX21ha2VfcmVxdWVzdCsweDIw
MC8weDVlOAo+ID4gPiA+IFsgIDY5MC42NjU5ODJdICBnZW5lcmljX21ha2VfcmVxdWVzdCsweDk0
LzB4MjcwCj4gPiA+ID4gWyAgNjkwLjY3MDIzOV0gIHN1Ym1pdF9iaW8rMHgzNC8weDE2OAo+ID4g
PiA+IFsgIDY5MC42NzM3MTJdICB4ZnNfc3VibWl0X2lvZW5kLmlzcmEuMCsweDljLzB4MTgwIFt4
ZnNdCj4gPiA+ID4gWyAgNjkwLjY3ODc5OF0gIHhmc19kb193cml0ZXBhZ2UrMHgyMzQvMHg0NTgg
W3hmc10KPiA+ID4gPiBbICA2OTAuNjgzMzE4XSAgd3JpdGVfY2FjaGVfcGFnZXMrMHgxYTQvMHgz
ZjgKPiA+ID4gPiBbICA2OTAuNjg3NDQyXSAgeGZzX3ZtX3dyaXRlcGFnZXMrMHg4NC8weGI4IFt4
ZnNdCj4gPiA+ID4gWyAgNjkwLjY5MTg3NF0gIGRvX3dyaXRlcGFnZXMrMHgzYy8weGUwCj4gPiA+
ID4gWyAgNjkwLjY5NTQzOF0gIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDQ4LzB4NDQwCj4g
PiA+ID4gWyAgNjkwLjcwMDA0Ml0gIHdyaXRlYmFja19zYl9pbm9kZXMrMHgxZWMvMHg0YjAKPiA+
ID4gPiBbICA2OTAuNzA0Mjk4XSAgX193cml0ZWJhY2tfaW5vZGVzX3diKzB4NTAvMHhlOAo+ID4g
PiA+IFsgIDY5MC43MDg1NTVdICB3Yl93cml0ZWJhY2srMHgyNjQvMHgzODgKPiA+ID4gPiBbICA2
OTAuNzEyMjA0XSAgd2JfZG9fd3JpdGViYWNrKzB4MzAwLzB4MzU4Cj4gPiA+ID4gWyAgNjkwLjcx
NjExM10gIHdiX3dvcmtmbisweDgwLzB4MWUwCj4gPiA+ID4gWyAgNjkwLjcxOTQxOF0gIHByb2Nl
c3Nfb25lX3dvcmsrMHgxYmMvMHgzZTgKPiA+ID4gPiBbICA2OTAuNzIzNDE0XSAgd29ya2VyX3Ro
cmVhZCsweDU0LzB4NDQwCj4gPiA+ID4gWyAgNjkwLjcyNzA2NF0gIGt0aHJlYWQrMHgxMDQvMHgx
MzAKPiA+ID4gPiBbICA2OTAuNzMwMjgxXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgKPiA+ID4g
PiBbICA2OTAuNzMzODQ3XSBDb2RlOiBlYjAwMDA3ZiA1NDAwMDIyMCBiNDAwMDA0MCBmODU2ODAy
MiAoZjk0MDFjNDIpCj4gPiA+ID4gWyAgNjkwLjczOTkyOF0gLS0tWyBlbmQgdHJhY2UgZDNmZDM5
MmY1NjllODZkMyBdLS0tCj4gPiA+ID4gCj4gPiA+ID4gaHR0cHM6Ly9hcnRpZmFjdHMuY2tpLXBy
b2plY3Qub3JnL3BpcGVsaW5lcy8yOTMwNjMvbG9ncy9hYXJjaDY0X2hvc3RfMl9jb25zb2xlLmxv
Zwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gVGhpcyBsb29rcyBsaWtlIHRoYXQgc2FtZSBpc3N1ZQo+
ID4gPiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE3Njc1MzkK
PiA+ID4gCj4gPiA+IEkgZG9uJ3QgdGhpbmsgdGhlIEJGUSBmaXggaGFzIGJlZW4gc2VudCB0byBz
dGFibGUgeWV0LCBvciBhdCBsZWFzdAo+ID4gPiBpdCB3YXMgbm90IGluIDUuMy4xMQo+ID4gCj4g
PiBBbnkgc3BlY2lmaWMgZ2l0IGNvbW1pdCBpZCBJIHNob3VsZCBiZSBwaWNraW5nIHVwIGZvciB0
aGlzPwo+ID4gCj4gPiB0aGFua3MsCj4gPiAKPiA+IGdyZWcgay1oCj4gPiAKPiAKPiBTaG91bGQg
YmUgNDc4ZGUzMzgwYzFjICgiYmxvY2ssIGJmcTogZGVzY2hlZHVsZSBlbXB0eSBiZnFfcXVldWVz
Cj4gbm90IHJlZmVycmVkIGJ5IGFueSBwcm9jZXNzIikgLgoKVGhhbmtzLCBub3cgcXVldWVkIHVw
LgoKZ3JlZyBrLWgKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
