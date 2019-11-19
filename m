Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3310362C
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 09:45:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64FBA3C23F0
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 09:45:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4B5353C220E
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 13:44:47 +0100 (CET)
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 631DD2016C0
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 13:44:43 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 38B7221F48;
 Tue, 19 Nov 2019 07:44:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 19 Nov 2019 07:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=A
 gKsUYC5wShRE3TR3Lvnxx0Ev85NdtUK9me8zfIo5gY=; b=qnh5u3OlkiASOESd0
 pwpvRU1cXK0sJDndIcKcZjUrJMzh9vzLCd5vvXYn8EFG+kbRM5kh/j7SrvXtDArW
 liAbA7/zIvMt7wT2R72AXY0L8gjnCKSKAHUypfwIfKa0ZnW54g2+D162+Z+hOPmm
 kgJFDptmLi1vNj5+b4xSOmWstddnauciiHZv6ftpxAIsbHVJHP578//PK/Fq/Kh9
 j8K6rtOlrjriqhFHmPRVWWPU/RmL3243ryuRdXDZf011FM2aZH3OQ5hvMSA9Z+wq
 DL2tYXh9s8OtJiHd/cssESrDTL8Mj3V9weIF1y7A7dHOEZNvfalCvZEsxjgZJUWp
 S2kGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=AgKsUYC5wShRE3TR3Lvnxx0Ev85NdtUK9me8zfIo5
 gY=; b=Qc0QZE+mW1iSblromfrHE5pBTPlfXswqPSPE374xtglBi7UyUlHnOqtU8
 jvgyOxALFHY4i+1Vef3YwX+5CP4zC/O64+1BsesmgWQFjFGHxMkN1XqyscOVkESM
 JniaQs75/RHIFQy/kz8kQPOCYRIwF05mHUmyFMcFXqBwOVPWK/hOerk2HFx4xE9W
 i3iD/qfF59XlOVROjcjC91S8S/cVOnJI6BJKLs6gHgrGBAC+l6CqfbL47cW2zj+X
 JimSwmcsrHWJ5bVAsTXiiWXmP5fliINQeoRK1VveJfKl1/xsDjwu9hKPkqpqWWGw
 QfRfsBUQR1lYiV8deMCMjyPmzMFKg==
X-ME-Sender: <xms:r-PTXYMTQjP53wJvS3EHE4OBhur6Jg_5LdWCZi7fFqm91LwWy2-Vng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinheptghkihdqph
 hrohhjvggtthdrohhrghdprhgvughhrghtrdgtohhmpdhkvghrnhgvlhdrohhrghenucfk
 phepkeelrddvtdehrddufedtrdelfeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvg
 hgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:r-PTXTP2kmhFaL5EwjMm7N0fU9Cmgo4kwlxJZjFnQ02_Kz-Oes4TAA>
 <xmx:r-PTXaSSc4IOlOuqTnqFbPqaUlSDR8yrUVPxBRwzB6LCO-tDzmPGCQ>
 <xmx:r-PTXVDRI9cd0B0wN1-il-r4IAVRsCdLpxPTQgANX-uesG48wVlRew>
 <xmx:sOPTXdHDjBorpmNIsqi-fo5uK37Yg73TknxwdVYumPH4YjvV1p1eKg>
Received: from localhost (unknown [89.205.130.93])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4AFF28005A;
 Tue, 19 Nov 2019 07:44:31 -0500 (EST)
Date: Tue, 19 Nov 2019 13:44:28 +0100
From: Greg KH <greg@kroah.com>
To: Laura Abbott <labbott@redhat.com>
Message-ID: <20191119124428.GC1975017@kroah.com>
References: <cki.042792963E.5VOWULC1Q9@redhat.com>
 <8e0fa6de-b6b1-23ac-9e77-d425c8d1ba22@redhat.com>
 <c326c35e-453e-2dae-391c-5324803e6112@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c326c35e-453e-2dae-391c-5324803e6112@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 20 Nov 2019 09:45:31 +0100
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

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMDc6Mzc6MDlBTSAtMDUwMCwgTGF1cmEgQWJib3R0IHdy
b3RlOgo+IE9uIDExLzE4LzE5IDc6MDcgUE0sIFJhY2hlbCBTaWJsZXkgd3JvdGU6Cj4gPiAKPiA+
IE9uIDExLzE4LzE5IDEwOjAwIEFNLCBDS0kgUHJvamVjdCB3cm90ZToKPiA+ID4gSGVsbG8sCj4g
PiA+IAo+ID4gPiBXZSByYW4gYXV0b21hdGVkIHRlc3RzIG9uIGEgcGF0Y2hzZXQgdGhhdCB3YXMg
cHJvcG9zZWQgZm9yIG1lcmdpbmcgaW50byB0aGlzCj4gPiA+IGtlcm5lbCB0cmVlLiBUaGUgcGF0
Y2hlcyB3ZXJlIGFwcGxpZWQgdG86Cj4gPiA+IAo+ID4gPiAgICAgICAgIEtlcm5lbCByZXBvOmh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51
eC5naXQKPiA+ID4gICAgICAgICAgICAgIENvbW1pdDogMTE2YTM5NWI3MDYxIC0gTGludXggNS4z
LjExCj4gPiA+IAo+ID4gPiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJl
IHByb3ZpZGVkIGJlbG93Lgo+ID4gPiAKPiA+ID4gICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVE
IChzZWUgZGV0YWlscyBiZWxvdykKPiA+ID4gICAgICAgICAgICAgICBNZXJnZTogT0sKPiA+ID4g
ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ID4gICAgICAgICAgICAgICBUZXN0czogRkFJTEVE
Cj4gPiA+IAo+ID4gPiBBbGwga2VybmVsIGJpbmFyaWVzLCBjb25maWcgZmlsZXMsIGFuZCBsb2dz
IGFyZSBhdmFpbGFibGUgZm9yIGRvd25sb2FkIGhlcmU6Cj4gPiA+IAo+ID4gPiAgICBodHRwczov
L2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxpbmVzLzI5MzA2Mwo+ID4gPiAKPiA+ID4g
T25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+ID4gCj4gPiA+ICAgICAgYWFyY2g2
NDoKPiA+ID4gICAgICAg4p2MIExUUCBsaXRlCj4gPiAKPiA+IEkgc2VlIGEgcGFuaWMgd2hlbiBp
bnN0YWxsaW5nIHRoZSBMVFAgZGVwZW5kZW5jaWVzCj4gPiAKPiA+IFsgIDY5MC42MjUwNjBdIENh
bGwgdHJhY2U6Cj4gPiBbICA2OTAuNjI3NDk1XSAgYmZxX2ZpbmRfc2V0X2dyb3VwKzB4OGMvMHhm
MAo+ID4gWyAgNjkwLjYzMTQ5MV0gIGJmcV9iaWNfdXBkYXRlX2Nncm91cCsweGJjLzB4MjE4Cj4g
PiBbICA2OTAuNjM1ODM0XSAgYmZxX2luaXRfcnErMHhhYy8weDgwOAo+ID4gWyAgNjkwLjYzOTMw
OV0gIGJmcV9pbnNlcnRfcmVxdWVzdC5pc3JhLjArMHhlMC8weDIwMAo+ID4gWyAgNjkwLjY0Mzk5
OV0gIGJmcV9pbnNlcnRfcmVxdWVzdHMrMHg2OC8weDg4Cj4gPiBbICA2OTAuNjQ4MDg1XSAgYmxr
X21xX3NjaGVkX2luc2VydF9yZXF1ZXN0cysweDg0LzB4MTQwCj4gPiBbICA2OTAuNjUzMDM2XSAg
YmxrX21xX2ZsdXNoX3BsdWdfbGlzdCsweDE3MC8weDJiMAo+ID4gWyAgNjkwLjY1NzU1NV0gIGJs
a19mbHVzaF9wbHVnX2xpc3QrMHhlYy8weDEwMAo+ID4gWyAgNjkwLjY2MTcyNV0gIGJsa19tcV9t
YWtlX3JlcXVlc3QrMHgyMDAvMHg1ZTgKPiA+IFsgIDY5MC42NjU5ODJdICBnZW5lcmljX21ha2Vf
cmVxdWVzdCsweDk0LzB4MjcwCj4gPiBbICA2OTAuNjcwMjM5XSAgc3VibWl0X2JpbysweDM0LzB4
MTY4Cj4gPiBbICA2OTAuNjczNzEyXSAgeGZzX3N1Ym1pdF9pb2VuZC5pc3JhLjArMHg5Yy8weDE4
MCBbeGZzXQo+ID4gWyAgNjkwLjY3ODc5OF0gIHhmc19kb193cml0ZXBhZ2UrMHgyMzQvMHg0NTgg
W3hmc10KPiA+IFsgIDY5MC42ODMzMThdICB3cml0ZV9jYWNoZV9wYWdlcysweDFhNC8weDNmOAo+
ID4gWyAgNjkwLjY4NzQ0Ml0gIHhmc192bV93cml0ZXBhZ2VzKzB4ODQvMHhiOCBbeGZzXQo+ID4g
WyAgNjkwLjY5MTg3NF0gIGRvX3dyaXRlcGFnZXMrMHgzYy8weGUwCj4gPiBbICA2OTAuNjk1NDM4
XSAgX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NDgvMHg0NDAKPiA+IFsgIDY5MC43MDAwNDJd
ICB3cml0ZWJhY2tfc2JfaW5vZGVzKzB4MWVjLzB4NGIwCj4gPiBbICA2OTAuNzA0Mjk4XSAgX193
cml0ZWJhY2tfaW5vZGVzX3diKzB4NTAvMHhlOAo+ID4gWyAgNjkwLjcwODU1NV0gIHdiX3dyaXRl
YmFjaysweDI2NC8weDM4OAo+ID4gWyAgNjkwLjcxMjIwNF0gIHdiX2RvX3dyaXRlYmFjaysweDMw
MC8weDM1OAo+ID4gWyAgNjkwLjcxNjExM10gIHdiX3dvcmtmbisweDgwLzB4MWUwCj4gPiBbICA2
OTAuNzE5NDE4XSAgcHJvY2Vzc19vbmVfd29yaysweDFiYy8weDNlOAo+ID4gWyAgNjkwLjcyMzQx
NF0gIHdvcmtlcl90aHJlYWQrMHg1NC8weDQ0MAo+ID4gWyAgNjkwLjcyNzA2NF0gIGt0aHJlYWQr
MHgxMDQvMHgxMzAKPiA+IFsgIDY5MC43MzAyODFdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxOAo+
ID4gWyAgNjkwLjczMzg0N10gQ29kZTogZWIwMDAwN2YgNTQwMDAyMjAgYjQwMDAwNDAgZjg1Njgw
MjIgKGY5NDAxYzQyKQo+ID4gWyAgNjkwLjczOTkyOF0gLS0tWyBlbmQgdHJhY2UgZDNmZDM5MmY1
NjllODZkMyBdLS0tCj4gPiAKPiA+IGh0dHBzOi8vYXJ0aWZhY3RzLmNraS1wcm9qZWN0Lm9yZy9w
aXBlbGluZXMvMjkzMDYzL2xvZ3MvYWFyY2g2NF9ob3N0XzJfY29uc29sZS5sb2cKPiA+IAo+IAo+
IFRoaXMgbG9va3MgbGlrZSB0aGF0IHNhbWUgaXNzdWUKPiBodHRwczovL2J1Z3ppbGxhLnJlZGhh
dC5jb20vc2hvd19idWcuY2dpP2lkPTE3Njc1MzkKPiAKPiBJIGRvbid0IHRoaW5rIHRoZSBCRlEg
Zml4IGhhcyBiZWVuIHNlbnQgdG8gc3RhYmxlIHlldCwgb3IgYXQgbGVhc3QKPiBpdCB3YXMgbm90
IGluIDUuMy4xMQoKQW55IHNwZWNpZmljIGdpdCBjb21taXQgaWQgSSBzaG91bGQgYmUgcGlja2lu
ZyB1cCBmb3IgdGhpcz8KCnRoYW5rcywKCmdyZWcgay1oCgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
