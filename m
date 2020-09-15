Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 26177269AF7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 03:18:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C37073C4F25
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 03:18:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D43BD3C21AE
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 03:18:47 +0200 (CEST)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5CD43600946
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 03:18:47 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id a2so1322465ybj.2
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 18:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mf8EzxM/ejnghdTasap0x6lKJhT6UYz1hp+nPiQpvbU=;
 b=vDL0bcqgjYpCNPHiao6ezzvoOQa/qrwKe2B2p/akROHAySI8YasMwWUg8pBetAHTwp
 bfensT8Es8rYLCknC6YCAncKl2UTHbBEQV63midUOuDKBIzmAyWXH+6kI9tet4huHloX
 G9n08gdYkxoCDM8yZJysKSBiWzKSbg59cJwJt+hl1z7ouHVpdwigAw4sKrR1CyoEqQQY
 QD+TMrjJTCnw3uDkTHq3aVD3Hjoin6zjCosv8vp6xkkYfSCYWb8W5f5+a7xKDvx1zgn0
 igs7EF/LI4FdkFj6q3DU6Ef/0JQ3G9cxQBBrV1cXi51twoK1DO3JIYNuFUGCjO08Ud4p
 BHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mf8EzxM/ejnghdTasap0x6lKJhT6UYz1hp+nPiQpvbU=;
 b=oPM+mBcoLwBfKyznDA4lcQ3BwbU1orS79XEE9qk2yyLos56j57bOghb113nmZXmlhw
 psoGEWwtfYFNPPR6aFW/pqdCKX0Ox/Z0JPMVWRpT9p7RkgMWxMaP4NmPX3Z4M9fRRAeF
 Tra6B8VHDNRX5wC2BQitoep/5FkNRDgXL/R7UPtue/XXc82RPhKDJimAyKJUmBn8tkyy
 r3vSt0D5mfe4GImZEwSHF1Yz2fDZWmNJD91iriL2XwwzEVV+JMKpXTeO1so9lBz075aG
 zoy6bKQsbDzVkRPgjhzwCgO/t5HnRISu1WURE9eBAJg7+DHFnhCiWxY7G8Km2GcaewL5
 3DlQ==
X-Gm-Message-State: AOAM5337bfDoot2cim8DvbSMtz4N4AStrtn4uCweTKFNzIEx9iLj0/1L
 1akDkrJC9899edtaUtUvBm9NpflyXkCAHrTMh28=
X-Google-Smtp-Source: ABdhPJxtv+odnSuJHTfjYtUrGv5wXf4LPeZqXG4y/Z6WydE3e8fkJ16OYGt2S7vb12XY0qmOdXfGBBB599WJLttPvgo=
X-Received: by 2002:a25:354:: with SMTP id 81mr23262300ybd.292.1600132726156; 
 Mon, 14 Sep 2020 18:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
 <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
 <20200909131327.GA3241@yuki.lan> <20200909132703.GB3241@yuki.lan>
 <CAEemH2e+Ck8M22gdgL0OQ24ekBPyDu4FwGrdG+da9E62UZWjRQ@mail.gmail.com>
 <CAEemH2eJCUuf=SQF_GdQ7U9q_8+BD9LsxPAgwuJS9wx8zBzNww@mail.gmail.com>
 <CAF12kFs+Wzm2rt5uE7WoHDXZSpdtZaZPgspKTACpYnw7zR+sgA@mail.gmail.com>
 <20200914110006.GD5524@yuki.lan>
 <CY4PR13MB117519BB030877EC596EDB75FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
In-Reply-To: <CY4PR13MB117519BB030877EC596EDB75FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
From: Cixi Geng <gengcixi@gmail.com>
Date: Tue, 15 Sep 2020 09:18:10 +0800
Message-ID: <CAF12kFtLT7dvqL5HK6B71uj3Y5Fd-A+WEQd3e14g2Nr=PgE3tQ@mail.gmail.com>
To: "Bird, Tim" <Tim.Bird@sony.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: Orson Zhai <orsonzhai@gmail.com>, LTP List <ltp@lists.linux.it>,
 "xingfeng.kang@unisoc.com" <xingfeng.kang@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhhbmtzIEJpcmQgYW5kIEN5cmlsLCAgSSB3aWxsIGJlIHdhaXRpbmcgZm9yIHdvcmsgdG8gc3Rh
cnQgdGhpcyB3b3JrCmFzIHNvb24gYXMgeW91ciBoYXZhIHRoZSB0aW1lCnRvIGd1aWRlIG1lCklm
IHRoZXJlIGhhdmUgYW55dGhpbmcgdG8gZG8gYmVmb3JlIGl0LCBqdXN0IHRlbGwgbWUuCgpCaXJk
LCBUaW0gPFRpbS5CaXJkQHNvbnkuY29tPiDkuo4yMDIw5bm0OeaciDE15pel5ZGo5LqMIOS4iuWN
iDE6NTHlhpnpgZPvvJoKPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206
IEN5cmlsIEhydWJpcwo+ID4KPiA+IEhpIQo+ID4gPiBDYW4gd2UgbWVyZ2UgdGhlIHVhcnQgZGV2
aWNlIGRyaXZlciB0ZXN0Y2FzZSBhbmQgdGhlIGRldmljZS1kaXNjb3Zlcgo+ID4gPiBmcmFtZXdv
cmsgPz8/Cj4gPgo+ID4gQ2FuIHdlIHBsZWFzZSBwb3N0cG9uZSBpdCBhIGxpdHRsZSBiaXQgYWdh
aW4/IEkndmUgYmVlbiB0YWxraW5nIHRvIFRpbQo+ID4gQmlyZCByZWNlbmx0eSBhbmQgaGUgaXMg
aW50ZXJlc3RpbmcgaW4gaGVscGluZyB0byBzaGFwZSB0aGUgaW50ZXJmYWNlIHNvCj4gPiBiZXR0
ZXIgdGhhdCBpdCBmaXRzIGludG8gZXhpc3RpbmcgaGFyZHdhcmUgbGFicy4KPgo+IEknbSB2ZXJ5
IGludGVyZXN0ZWQgaW4gdGhpcyB3b3JrLCBhbmQgaG93IHRvIGludGVncmF0ZSBpdCB3aXRoCj4g
ZXh0ZXJuYWwgdGVzdCBmcmFtZXdvcmtzIHRoYXQgbWFuYWdlIGxhYiBlcXVpcG1lbnQgKGFuZCBt
YXkKPiBuZWVkIHRvIGNvbW11bmljYXRlIHRlc3QgcGFyYW1ldGVycyB0byB0ZXN0cykuCj4KPiBJ
J20gbm90IHN1cmUgdGhlIGJlc3Qgd2F5IHRvIHByb2NlZWQuICBJIHJldmlld2VkIHRoZSBkZXZp
Y2UtZGlzY292ZXJ5Cj4gY29kZSBvbiBwYXRjaHdvcmtzLCBidXQgSSdtIG5vdCBzdXJlIEkgdW5k
ZXJzdGFuZCB0aGUgYW50aWNpcGF0ZWQgZmxvdyBvZgo+IGNvbnRyb2wgYmV0d2VlbiB0aGUgTFRQ
IHRlc3QsIHRoZSBkZXZpY2UgZGlzY292ZXJ5IHBhcnQsIGFuZCB0aGUgdGVzdAo+IGZyYW1ld29y
ay4KPgo+IEkga25vdyB5b3UncmUgYnVzeSB3aXRoIHRoZSBMVFAgcmVsZWFzZSwgc28gSSdtIG5v
dCBzdXJlIHRoaXMgaXMgdGhlIGJlc3QKPiB0aW1lIHRvIG9wZW4gdXAgYSBiaWcgdGhyZWFkIGFz
a2luZyBhIGxvdCBvZiBxdWVzdGlvbnMgYWJvdXQgZGV2aWNlIGRpc2NvdmVyeQo+IG9yIGRlc2Ny
aWJpbmcgbXkgb3duIHByb3Bvc2FsIGZvciB0aGlzIC0gdG8gd29yayB0b3dhcmRzIGhhcm1vbml6
aW5nIHRoZSB0d28uCj4KPiBCdXQgSSdtIGtlZW4gb24gZm9sbG93aW5nIHVwIG9uIHRoaXMgaW4g
dGhlIHNob3J0IHRlcm0gKG5leHQgNCB3ZWVrcyBvciBzbykuCj4gSSdtIGdpdmluZyBhIHRhbGsg
YXQgT3BlbiBTb3VyY2UgU3VtbWl0IEV1cm9wZSB0aGUgZW5kIG9mIE9jdG9iZXIsCj4gd2hlcmUg
SSdsbCBiZSB0YWxraW5nIGFib3V0IGxhYiBtYW5hZ2VtZW50IEFQSXMsIGFuZCB0aGlzIGRvdmV0
YWlscwo+IGludG8gdGhhdCB3b3JrLgo+Cj4gTGV0IG1lIGtub3cgd2hlbiB3b3VsZCBiZSBhIGdv
b2QgdGltZSB0byB0cnkgdG8gaGFzaCB0aGlzIG91dC4KPiAgLS0gVGltCj4KCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
