Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294687CBA5
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Mar 2024 11:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1710499935; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=/pwOUrhlzL2H/N+Q/aRj2yxnTUzp+y3n/Qn2hnoeQZM=;
 b=Qyu+RyJN2MauuhpcwN1Q37bWVpeT3BrnKFGLeeDAaTTkgt/tz+0pHVf8UdZNE9P7hW7zU
 6fRm7DvD2f9iwE2mAJ31fS/OuX/IaBiqPL/dd3eoUAdmqI0WjGFiP4Ttj4/sz0mwbnQcaHb
 lt1GSivffJJXJTLCw+bE2JiB0sfrNeQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A71913D09FF
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Mar 2024 11:52:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7C4D3C196B
 for <ltp@lists.linux.it>; Fri, 15 Mar 2024 11:52:12 +0100 (CET)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D27F3208E02
 for <ltp@lists.linux.it>; Fri, 15 Mar 2024 11:52:11 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-413fffc0a4dso3760165e9.3
 for <ltp@lists.linux.it>; Fri, 15 Mar 2024 03:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1710499931; x=1711104731; darn=lists.linux.it;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8LTTTA7w9GksSA1Xox4dkJL2mZgx6/nMvIf5zTFSfrU=;
 b=A/gpG0y7A0wiIMDDKXuoiZDNOsYJ1c69wDs9Y6RrLIvrRoEkZzHgb0o4LgwJ1ptdQC
 bEqbmAefwab5y3Ho+54Y/6MNdOEvnhD6HadB/LY1LNYEe1PqekjX9DcD6tLw7/2PvSPP
 8GoW3jrjNtKqagAXkY3mM7d+73kpnDs/QY7DJ2hu3IzJTK9zkPPIfByzprAimUiiTDLR
 f9SK5OCrg4PIpfR4xrrw80reQqDpuTLWHsolijNaDaKScZv+GqCz7FFKej23GaTg86Ky
 B9N3pbPBAftziVWci6UiuNSRbb85yLuG8YT6TZyDgmW0kHA7+0XYGEx2zd9NVTonpemr
 UYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710499931; x=1711104731;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8LTTTA7w9GksSA1Xox4dkJL2mZgx6/nMvIf5zTFSfrU=;
 b=LeennDu7mxi6yRIcLjvpHDYJF6PH1RyVIGGkUx3KqL74+ShF86PX1I7ddSYEYWBgkd
 lBWV1Cli6SyoSgYUf1BGj6fgAr+L9M4ra1atbMr5aWCWeRi7hYRqJGFHNB2TtR93hWmn
 L7Bw0S5YyFTqjj4F+9iuvIB6FcBqRqRzDezUxalcPg6CT6c7IrgYu5mazTB7oBR86lWk
 lX6BuO6xIHD31JfSQczPiEyxA36x7iEpuZH/mmqVjlFiMw0/+UCxGHvflZvc2FylLnXC
 eI9jB4rtH1VgzZIpOC8Zy23hZH3BtckGdLm0za+7Z6T8rae9lwFhoxRhj9BzZDL09ohC
 f8cA==
X-Gm-Message-State: AOJu0YyrFcfO4Ve3sQAAzU1axPggBle6ojmngQyMznLAm18dNOH1lszc
 NRhdAudboKqc8F49eEIBGjnwOLOb7Q02dhCrpOdyRNaS4BNjJ1MxPVWVwgdOubBOBwZEOkcEAFw
 =
X-Google-Smtp-Source: AGHT+IEO1fHT1HplxJ3m9zd9vSYKQT52PQ9Xyl40weJtxXraTzst7LUcj6ygo90vwAFI2olHAl5Wqg==
X-Received: by 2002:a05:600c:310e:b0:413:f4b5:dd1b with SMTP id
 g14-20020a05600c310e00b00413f4b5dd1bmr1963311wmo.14.1710499931089; 
 Fri, 15 Mar 2024 03:52:11 -0700 (PDT)
Received: from wegao.157.234.177 ([81.95.8.245])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b00413ea26f942sm8135365wmq.14.2024.03.15.03.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:52:10 -0700 (PDT)
Date: Fri, 15 Mar 2024 06:52:04 -0400
To: Li Wang <liwang@redhat.com>
Message-ID: <ZfQoVC7xBfGHNsgI@wegao.157.234.177>
References: <CAEemH2cTzLuJ1uTBNbUB-E7kJPeHjx3sPi1crkqTCJ6h4DgSbg@mail.gmail.com>
 <20240315062448.3181177-1-liwang@redhat.com>
 <ZfP8YEwKpLGweAe1@wegao.29.253.26>
 <CAEemH2e5BB=L6-uT25ppcjGnXqJu7U-MmTCNdFsu8FE3sGv=Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e5BB=L6-uT25ppcjGnXqJu7U-MmTCNdFsu8FE3sGv=Lw@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] swapon01: swapon01: prevent OOM happening in swap
 process
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgMDQ6MzY6NDNQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBGcmksIE1hciAxNSwgMjAyNCBhdCAzOjQ04oCvUE0gV2VpIEdhbyA8d2VnYW9Ac3VzZS5j
b20+IHdyb3RlOgo+IAo+ID4gT24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgMDI6MjQ6NDhQTSArMDgw
MCwgTGkgV2FuZyB3cm90ZToKPiA+ID4gSGVyZSB3ZSB0YWtlIG1hbnkgd2F5cyB0byBwcmV2ZW50
IHRoZSBPT00gaGFwcGVuaW5nIHdpdGgKPiA+ID4gcnVuIHRoZSBzd2Fwb24gdGVzdDoKPiA+ID4K
PiA+ID4gICAqIHNocmluayB0aGUgcG9sbHV0ZSBtZW1vcnkgc2l6ZQo+ID4gPiAgICogaW5jcmVh
c2Ugc3dhcGZpbGUgc2l6ZQo+ID4gPiAgICogc2V0dGluZyBzd2FwIG1heCBmb3IgQ2dyb3VwCj4g
PiA+ICAgKiBzZXR0aW5nIHRlc3Qgb29tX3Njb3JlX2FkaiB0byAtMTAwMAo+ID4gPgo+ID4gPiBS
ZXByb3RlZC1ieTogV2VpIEdhbyA8d2VnYW9Ac3VzZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gTm90ZXM6
Cj4gPiA+ICAgICBIaSBXZWksCj4gPiA+Cj4gPiA+ICAgICAgICBDb3VsZCB5b3UgcGxlYXNlIHRl
c3QgdGhpcyBwYXRjaCBhbmQgcG9zdCB0aGUgb3V0cHV0IG1lc3NhZ2VzPwo+ID4gdHN0X2Rldmlj
ZS5jOjk3OiBUSU5GTzogRm91bmQgZnJlZSBkZXZpY2UgMSAnL2Rldi9sb29wMScKPiA+IHRzdF90
ZXN0LmM6MTc0MTogVElORk86IExUUCB2ZXJzaW9uOiAyMDI0MDEyOS05NC1nOGYxNGIwNmUwCj4g
PiB0c3RfdGVzdC5jOjE2Mjc6IFRJTkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDBtIDMwcwo+
ID4gdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBUSU5GTzogS2VybmVsIHN1cHBvcnRzIGV4
dDIKPiA+IHRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMuYzo2MjogVElORk86IG1rZnMuZXh0MiBkb2Vz
IGV4aXN0Cj4gPiB0c3Rfc3VwcG9ydGVkX2ZzX3R5cGVzLmM6OTc6IFRJTkZPOiBLZXJuZWwgc3Vw
cG9ydHMgZXh0Mwo+ID4gdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjYyOiBUSU5GTzogbWtmcy5l
eHQzIGRvZXMgZXhpc3QKPiA+IHRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMuYzo5NzogVElORk86IEtl
cm5lbCBzdXBwb3J0cyBleHQ0Cj4gPiB0c3Rfc3VwcG9ydGVkX2ZzX3R5cGVzLmM6NjI6IFRJTkZP
OiBta2ZzLmV4dDQgZG9lcyBleGlzdAo+ID4gdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBU
SU5GTzogS2VybmVsIHN1cHBvcnRzIHhmcwo+ID4gdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjYy
OiBUSU5GTzogbWtmcy54ZnMgZG9lcyBleGlzdAo+ID4gdHN0X3N1cHBvcnRlZF9mc190eXBlcy5j
Ojk3OiBUSU5GTzogS2VybmVsIHN1cHBvcnRzIGJ0cmZzCj4gPiB0c3Rfc3VwcG9ydGVkX2ZzX3R5
cGVzLmM6NjI6IFRJTkZPOiBta2ZzLmJ0cmZzIGRvZXMgZXhpc3QKPiA+IHRzdF9zdXBwb3J0ZWRf
ZnNfdHlwZXMuYzoxMDU6IFRJTkZPOiBTa2lwcGluZyBiY2FjaGVmcyBiZWNhdXNlIG9mIEZVU0UK
PiA+IGJsYWNrbGlzdAo+ID4gdHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBUSU5GTzogS2Vy
bmVsIHN1cHBvcnRzIHZmYXQKPiA+IHRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMuYzo2MjogVElORk86
IG1rZnMudmZhdCBkb2VzIGV4aXN0Cj4gPiB0c3Rfc3VwcG9ydGVkX2ZzX3R5cGVzLmM6OTc6IFRJ
TkZPOiBLZXJuZWwgc3VwcG9ydHMgZXhmYXQKPiA+IHRzdF9zdXBwb3J0ZWRfZnNfdHlwZXMuYzo1
ODogVElORk86IG1rZnMuZXhmYXQgZG9lcyBub3QgZXhpc3QKPiA+IHRzdF9zdXBwb3J0ZWRfZnNf
dHlwZXMuYzoxMjg6IFRJTkZPOiBGaWxlc3lzdGVtIG50ZnMgaXMgbm90IHN1cHBvcnRlZAo+ID4g
dHN0X3N1cHBvcnRlZF9mc190eXBlcy5jOjk3OiBUSU5GTzogS2VybmVsIHN1cHBvcnRzIHRtcGZz
Cj4gPiB0c3Rfc3VwcG9ydGVkX2ZzX3R5cGVzLmM6NDk6IFRJTkZPOiBta2ZzIGlzIG5vdCBuZWVk
ZWQgZm9yIHRtcGZzCj4gPiB0c3RfdGVzdC5jOjE3MDE6IFRJTkZPOiA9PT0gVGVzdGluZyBvbiBl
eHQyID09PQo+ID4gdHN0X3Rlc3QuYzoxMTE4OiBUSU5GTzogRm9ybWF0dGluZyAvZGV2L2xvb3Ax
IHdpdGggZXh0MiBvcHRzPScnIGV4dHJhCj4gPiBvcHRzPScnCj4gPiBta2UyZnMgMS40Ny4wICg1
LUZlYi0yMDIzKQo+ID4gdHN0X3Rlc3QuYzoxMTMyOiBUSU5GTzogTW91bnRpbmcgL2Rldi9sb29w
MSB0byAvdG1wL0xUUF9zd2FmSEdMUGUvbW50cG9pbnQKPiA+IGZzdHlwPWV4dDIgZmxhZ3M9MAo+
ID4gdHN0X2lvY3RsLmM6MjY6IFRJTkZPOiBGSUJNQVAgaW9jdGwgaXMgc3VwcG9ydGVkCj4gPiBz
d2Fwb24wMS5jOjI3OiBUUEFTUzogdHN0X3N5c2NhbGwoX19OUl9zd2Fwb24sIFNXQVBfRklMRSwg
MCkgcGFzc2VkCj4gPiBzd2Fwb24wMS5jOjMwOiBUSU5GTzogU3dhcENhY2hlZDogMCBLYgo+ID4g
dHN0X3Rlc3QuYzoxNzAxOiBUSU5GTzogPT09IFRlc3Rpbmcgb24gZXh0MyA9PT0KPiA+IHRzdF90
ZXN0LmM6MTExODogVElORk86IEZvcm1hdHRpbmcgL2Rldi9sb29wMSB3aXRoIGV4dDMgb3B0cz0n
JyBleHRyYQo+ID4gb3B0cz0nJwo+ID4gbWtlMmZzIDEuNDcuMCAoNS1GZWItMjAyMykKPiA+IHRz
dF90ZXN0LmM6MTEzMjogVElORk86IE1vdW50aW5nIC9kZXYvbG9vcDEgdG8gL3RtcC9MVFBfc3dh
ZkhHTFBlL21udHBvaW50Cj4gPiBmc3R5cD1leHQzIGZsYWdzPTAKPiA+IHRzdF9pb2N0bC5jOjI2
OiBUSU5GTzogRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZAo+ID4gc3dhcG9uMDEuYzoyNzogVFBB
U1M6IHRzdF9zeXNjYWxsKF9fTlJfc3dhcG9uLCBTV0FQX0ZJTEUsIDApIHBhc3NlZAo+ID4gc3dh
cG9uMDEuYzozMDogVElORk86IFN3YXBDYWNoZWQ6IDAgS2IKPiA+IHRzdF90ZXN0LmM6MTcwMTog
VElORk86ID09PSBUZXN0aW5nIG9uIGV4dDQgPT09Cj4gPiB0c3RfdGVzdC5jOjExMTg6IFRJTkZP
OiBGb3JtYXR0aW5nIC9kZXYvbG9vcDEgd2l0aCBleHQ0IG9wdHM9JycgZXh0cmEKPiA+IG9wdHM9
JycKPiA+IG1rZTJmcyAxLjQ3LjAgKDUtRmViLTIwMjMpCj4gPiB0c3RfdGVzdC5jOjExMzI6IFRJ
TkZPOiBNb3VudGluZyAvZGV2L2xvb3AxIHRvIC90bXAvTFRQX3N3YWZIR0xQZS9tbnRwb2ludAo+
ID4gZnN0eXA9ZXh0NCBmbGFncz0wCj4gPiB0c3RfaW9jdGwuYzoyNjogVElORk86IEZJQk1BUCBp
b2N0bCBpcyBzdXBwb3J0ZWQKPiA+IHN3YXBvbjAxLmM6Mjc6IFRQQVNTOiB0c3Rfc3lzY2FsbChf
X05SX3N3YXBvbiwgU1dBUF9GSUxFLCAwKSBwYXNzZWQKPiA+IHN3YXBvbjAxLmM6MzA6IFRJTkZP
OiBTd2FwQ2FjaGVkOiAwIEtiCj4gPiB0c3RfdGVzdC5jOjE3MDE6IFRJTkZPOiA9PT0gVGVzdGlu
ZyBvbiB4ZnMgPT09Cj4gPiB0c3RfdGVzdC5jOjExMTg6IFRJTkZPOiBGb3JtYXR0aW5nIC9kZXYv
bG9vcDEgd2l0aCB4ZnMgb3B0cz0nJyBleHRyYQo+ID4gb3B0cz0nJwo+ID4gdHN0X3Rlc3QuYzox
MTMyOiBUSU5GTzogTW91bnRpbmcgL2Rldi9sb29wMSB0byAvdG1wL0xUUF9zd2FmSEdMUGUvbW50
cG9pbnQKPiA+IGZzdHlwPXhmcyBmbGFncz0wCj4gPiB0c3RfaW9jdGwuYzoyNjogVElORk86IEZJ
Qk1BUCBpb2N0bCBpcyBzdXBwb3J0ZWQKPiA+IHN3YXBvbjAxLmM6Mjc6IFRQQVNTOiB0c3Rfc3lz
Y2FsbChfX05SX3N3YXBvbiwgU1dBUF9GSUxFLCAwKSBwYXNzZWQKPiA+IHN3YXBvbjAxLmM6MzA6
IFRJTkZPOiBTd2FwQ2FjaGVkOiAwIEtiCj4gPiB0c3RfdGVzdC5jOjE3MDE6IFRJTkZPOiA9PT0g
VGVzdGluZyBvbiBidHJmcyA9PT0KPiA+IHRzdF90ZXN0LmM6MTExODogVElORk86IEZvcm1hdHRp
bmcgL2Rldi9sb29wMSB3aXRoIGJ0cmZzIG9wdHM9JycgZXh0cmEKPiA+IG9wdHM9JycKPiA+IHRz
dF90ZXN0LmM6MTEzMjogVElORk86IE1vdW50aW5nIC9kZXYvbG9vcDEgdG8gL3RtcC9MVFBfc3dh
ZkhHTFBlL21udHBvaW50Cj4gPiBmc3R5cD1idHJmcyBmbGFncz0wCj4gPiBsaWJzd2FwLmM6NDI6
IFRJTkZPOiBGU19OT0NPV19GTCBhdHRyaWJ1dGUgc2V0IG9uIG1udHBvaW50L3N3YXBmaWxlMDEK
PiA+IHRzdF9pb2N0bC5jOjIxOiBUSU5GTzogRklCTUFQIGlvY3RsIGlzIE5PVCBzdXBwb3J0ZWQ6
IEVJTlZBTCAoMjIpCj4gPiBsaWJzd2FwLmM6MTI1OiBUSU5GTzogRmlsZSAnbW50cG9pbnQvc3dh
cGZpbGUwMScgaXMgbm90IGNvbnRpZ3VvdXMKPiA+IGxpYnN3YXAuYzo0MjogVElORk86IEZTX05P
Q09XX0ZMIGF0dHJpYnV0ZSBzZXQgb24gbW50cG9pbnQvc3dhcGZpbGUwMQo+ID4gc3dhcG9uMDEu
YzoyNzogVFBBU1M6IHRzdF9zeXNjYWxsKF9fTlJfc3dhcG9uLCBTV0FQX0ZJTEUsIDApIHBhc3Nl
ZAo+ID4gc3dhcG9uMDEuYzozMDogVElORk86IFN3YXBDYWNoZWQ6IDAgS2IKPiA+IHRzdF90ZXN0
LmM6MTcwMTogVElORk86ID09PSBUZXN0aW5nIG9uIHZmYXQgPT09Cj4gPiB0c3RfdGVzdC5jOjEx
MTg6IFRJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9vcDEgd2l0aCB2ZmF0IG9wdHM9JycgZXh0cmEK
PiA+IG9wdHM9JycKPiA+IHRzdF90ZXN0LmM6MTEzMjogVElORk86IE1vdW50aW5nIC9kZXYvbG9v
cDEgdG8gL3RtcC9MVFBfc3dhZkhHTFBlL21udHBvaW50Cj4gPiBmc3R5cD12ZmF0IGZsYWdzPTAK
PiA+IHRzdF9pb2N0bC5jOjI2OiBUSU5GTzogRklCTUFQIGlvY3RsIGlzIHN1cHBvcnRlZAo+ID4g
c3dhcG9uMDEuYzoyNzogVFBBU1M6IHRzdF9zeXNjYWxsKF9fTlJfc3dhcG9uLCBTV0FQX0ZJTEUs
IDApIHBhc3NlZAo+ID4KPiAKPiAKPiA+IHN3YXBvbjAxLmM6MzA6IFRJTkZPOiBTd2FwQ2FjaGVk
OiAwIEtiCj4gPgo+IAo+IFRoYXQncyBteSBjb25jZXJuIGhlcmUsIHdpdGggc2hyaW5raW5nIHRo
ZSBwb2xsdXRlZCBtZW1vcnkgc2l6ZSwKPiBzd2FwcGluZyBpcyBub3QgdHJpZ2dlcmVkLCB0aGlz
IGlzIG5vdCB3aGF0IHdlIGV4cGVjdGVkLgo+IAo+IEFuZCBjb3VsZCB5b3UgYGNhdCAvcHJvYy9z
eXMvdm0vc3dhcHBpbmVzc2AgYmVmb3JlIGRvaW5nIHRoZSB0ZXN0PwpiZWZvcmUgdGhlIHRlc3Qg
dGhlIHN3YXBwaW5lc3MgaXMgNjAKY2F0IC9wcm9jL3N5cy92bS9zd2FwcGluZXNzCjYwCgpJIGhh
dmUgdHJpZWQgdXNlIHN3YXBwaW5lc3MgNjAgb3IgMTAwIHRoZSByZXN1bHQgaXMgc2FtZShTd2Fw
Q2FjaGVkOiAwIEtiKQp0c3RfdGVzdC5jOjE3MDE6IFRJTkZPOiA9PT0gVGVzdGluZyBvbiBleHQy
ID09PQp0c3RfdGVzdC5jOjExMTg6IFRJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9vcDQgd2l0aCBl
eHQyIG9wdHM9JycgZXh0cmEgb3B0cz0nJwpta2UyZnMgMS40Ny4wICg1LUZlYi0yMDIzKQp0c3Rf
dGVzdC5jOjExMzI6IFRJTkZPOiBNb3VudGluZyAvZGV2L2xvb3A0IHRvIC90bXAvTFRQX3N3YWpD
dnZpeC9tbnRwb2ludCBmc3R5cD1leHQyIGZsYWdzPTAKdHN0X2lvY3RsLmM6MjY6IFRJTkZPOiBG
SUJNQVAgaW9jdGwgaXMgc3VwcG9ydGVkCnN3YXBvbjAxLmM6Mjc6IFRQQVNTOiB0c3Rfc3lzY2Fs
bChfX05SX3N3YXBvbiwgU1dBUF9GSUxFLCAwKSBwYXNzZWQKc3dhcG9uMDEuYzozMTogVElORk86
IFN3YXBDYWNoZWQ6IDAgS2IgPDw8PDw8PDw8Cgo+IAo+IEFuIGltcHJvdmVkIFYyICh3aXRoIHNl
dHRpbmcgc3dhcHBpbmVzcyB0byA2MCBwZXJjZW50KToKPiAKPiAtLS0gYS90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMS5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb24vc3dhcG9uMDEuYwo+IEBAIC0yNiw3ICsyNiw3IEBAIHN0YXRpYyB2b2lk
IHZlcmlmeV9zd2Fwb24odm9pZCkKPiAgewo+ICAgICAgICAgVFNUX0VYUF9QQVNTKHRzdF9zeXNj
YWxsKF9fTlJfc3dhcG9uLCBTV0FQX0ZJTEUsIDApKTsKPiAKPiAtICAgICAgIHRzdF9wb2xsdXRl
X21lbW9yeShURVNUTUVNLCAweDQxKTsKPiArICAgICAgIHRzdF9wb2xsdXRlX21lbW9yeShURVNU
TUVNICogOS8xMCwgMHg0MSk7Cj4gICAgICAgICB0c3RfcmVzKFRJTkZPLCAiU3dhcENhY2hlZDog
JWxkIEtiIiwKPiBTQUZFX1JFQURfTUVNSU5GTygiU3dhcENhY2hlZDoiKSk7Cj4gCj4gICAgICAg
ICBpZiAoVFNUX1BBU1MgJiYgdHN0X3N5c2NhbGwoX19OUl9zd2Fwb2ZmLCBTV0FQX0ZJTEUpICE9
IDApIHsKPiBAQCAtMzcsMTEgKzM3LDI1IEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9zd2Fwb24odm9p
ZCkKPiAKPiAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPiAgewo+ICsgICAgICAgdHN0X2VuYWJs
ZV9vb21fcHJvdGVjdGlvbigwKTsKPiAgICAgICAgIGlzX3N3YXBfc3VwcG9ydGVkKFNXQVBfRklM
RSk7Cj4gLSAgICAgICBtYWtlX3N3YXBmaWxlKFNXQVBfRklMRSwgMTAsIDApOwo+ICsgICAgICAg
bWFrZV9zd2FwZmlsZShTV0FQX0ZJTEUsIDEwMjQsIDApOwo+IAo+ICAgICAgICAgU0FGRV9DR19Q
UklOVEYodHN0X2NnLCAiY2dyb3VwLnByb2NzIiwgIiVkIiwgZ2V0cGlkKCkpOwo+ICAgICAgICAg
U0FGRV9DR19QUklOVEYodHN0X2NnLCAibWVtb3J5Lm1heCIsICIlbHUiLCBURVNUTUVNKTsKPiAr
Cj4gKyAgICAgICBpZiAoU0FGRV9DR19IQVModHN0X2NnLCAibWVtb3J5LnN3YXAubWF4IikpCj4g
KyAgICAgICAgICAgICAgIFNBRkVfQ0dfUFJJTlRGKHRzdF9jZywgIm1lbW9yeS5zd2FwLm1heCIs
ICIlbGQiLCBURVNUTUVNICoKPiAyKTsKPiArCj4gKyAgICAgICBpZiAoU0FGRV9DR19IQVModHN0
X2NnLCAibWVtb3J5LnN3YXBwaW5lc3MiKSkKPiArICAgICAgICAgICAgICAgU0FGRV9DR19QUklO
VCh0c3RfY2csICJtZW1vcnkuc3dhcHBpbmVzcyIsICI2MCIpOwo+ICsgICAgICAgZWxzZQo+ICsg
ICAgICAgICAgICAgICBGSUxFX1BSSU5URigiL3Byb2Mvc3lzL3ZtL3N3YXBwaW5lc3MiLCAiJWQi
LCA2MCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGNsZWFudXAodm9pZCkKPiArewo+ICsgICAg
ICAgdHN0X2Rpc2FibGVfb29tX3Byb3RlY3Rpb24oMCk7Cj4gIH0KPiAKPiAgc3RhdGljIHN0cnVj
dCB0c3RfdGVzdCB0ZXN0ID0gewo+IEBAIC01MCw2ICs2NCwxMiBAQCBzdGF0aWMgc3RydWN0IHRz
dF90ZXN0IHRlc3QgPSB7Cj4gICAgICAgICAubmVlZHNfcm9vdCA9IDEsCj4gICAgICAgICAuYWxs
X2ZpbGVzeXN0ZW1zID0gMSwKPiAgICAgICAgIC5uZWVkc19jZ3JvdXBfY3RybHMgPSAoY29uc3Qg
Y2hhciAqY29uc3QgW10peyAibWVtb3J5IiwgTlVMTCB9LAo+ICsgICAgICAgLnNhdmVfcmVzdG9y
ZSA9IChjb25zdCBzdHJ1Y3QgdHN0X3BhdGhfdmFsW10pIHsKPiArICAgICAgICAgICAgICAgeyIv
cHJvYy9zeXMvdm0vc3dhcHBpbmVzcyIsIE5VTEwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
VFNUX1NSX1NLSVBfTUlTU0lORyB8IFRTVF9TUl9UQ09ORl9ST30sCj4gKyAgICAgICAgICAgICAg
IHt9Cj4gKyAgICAgICB9LAo+ICAgICAgICAgLnRlc3RfYWxsID0gdmVyaWZ5X3N3YXBvbiwKPiAt
ICAgICAgIC5zZXR1cCA9IHNldHVwCj4gKyAgICAgICAuc2V0dXAgPSBzZXR1cCwKPiArICAgICAg
IC5jbGVhbnVwID0gY2xlYW51cAo+ICB9Owo+IAo+IAo+IAo+IAo+ID4gdHN0X3Rlc3QuYzoxNzAx
OiBUSU5GTzogPT09IFRlc3Rpbmcgb24gdG1wZnMgPT09Cj4gPiB0c3RfdGVzdC5jOjExMTg6IFRJ
TkZPOiBTa2lwcGluZyBta2ZzIGZvciBUTVBGUyBmaWxlc3lzdGVtCj4gPiB0c3RfdGVzdC5jOjEw
OTg6IFRJTkZPOiBMaW1pdGluZyB0bXBmcyBzaXplIHRvIDMyTUIKPiA+IHRzdF90ZXN0LmM6MTEz
MjogVElORk86IE1vdW50aW5nIGx0cC10bXBmcyB0byAvdG1wL0xUUF9zd2FmSEdMUGUvbW50cG9p
bnQKPiA+IGZzdHlwPXRtcGZzIGZsYWdzPTAKPiA+IHRzdF9pb2N0bC5jOjIxOiBUSU5GTzogRklC
TUFQIGlvY3RsIGlzIE5PVCBzdXBwb3J0ZWQ6IEVJTlZBTCAoMjIpCj4gPiBsaWJzd2FwLmM6MjE0
OiBUQ09ORjogU3dhcGZpbGUgb24gdG1wZnMgbm90IGltcGxlbWVudGVkCj4gPgo+ID4gU3VtbWFy
eToKPiA+IHBhc3NlZCAgIDYKPiA+IGZhaWxlZCAgIDAKPiA+IGJyb2tlbiAgIDAKPiA+IHNraXBw
ZWQgIDEKPiA+IHdhcm5pbmdzIDAKPiA+Cj4gPgo+ID4gPiAgICAgICAgVGhhbmtzISEKPiA+ID4K
PiA+ID4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMgfCAxNyAr
KysrKysrKysrKysrKy0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMS5jCj4gPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvc3dhcG9uL3N3YXBvbjAxLmMKPiA+ID4gaW5kZXggZDQwNmU0YmQ5Li5iNGZjMDJkNmUgMTAw
NjQ0Cj4gPiA+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAx
LmMKPiA+ID4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDEu
Ywo+ID4gPiBAQCAtMjYsNyArMjYsNyBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfc3dhcG9uKHZvaWQp
Cj4gPiA+ICB7Cj4gPiA+ICAgICAgIFRTVF9FWFBfUEFTUyh0c3Rfc3lzY2FsbChfX05SX3N3YXBv
biwgU1dBUF9GSUxFLCAwKSk7Cj4gPiA+Cj4gPiA+IC0gICAgIHRzdF9wb2xsdXRlX21lbW9yeShU
RVNUTUVNLCAweDQxKTsKPiA+ID4gKyAgICAgdHN0X3BvbGx1dGVfbWVtb3J5KFRFU1RNRU0gKiA5
LzEwLCAweDQxKTsKPiA+ID4gICAgICAgdHN0X3JlcyhUSU5GTywgIlN3YXBDYWNoZWQ6ICVsZCBL
YiIsCj4gPiBTQUZFX1JFQURfTUVNSU5GTygiU3dhcENhY2hlZDoiKSk7Cj4gPiA+Cj4gPiA+ICAg
ICAgIGlmIChUU1RfUEFTUyAmJiB0c3Rfc3lzY2FsbChfX05SX3N3YXBvZmYsIFNXQVBfRklMRSkg
IT0gMCkgewo+ID4gPiBAQCAtMzcsMTEgKzM3LDIxIEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9zd2Fw
b24odm9pZCkKPiA+ID4KPiA+ID4gIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gPiA+ICB7Cj4g
PiA+ICsgICAgIHRzdF9lbmFibGVfb29tX3Byb3RlY3Rpb24oMCk7Cj4gPiA+ICAgICAgIGlzX3N3
YXBfc3VwcG9ydGVkKFNXQVBfRklMRSk7Cj4gPiA+IC0gICAgIG1ha2Vfc3dhcGZpbGUoU1dBUF9G
SUxFLCAxMCwgMCk7Cj4gPiA+ICsgICAgIG1ha2Vfc3dhcGZpbGUoU1dBUF9GSUxFLCAxMDI0LCAw
KTsKPiA+ID4KPiA+ID4gICAgICAgU0FGRV9DR19QUklOVEYodHN0X2NnLCAiY2dyb3VwLnByb2Nz
IiwgIiVkIiwgZ2V0cGlkKCkpOwo+ID4gPiAgICAgICBTQUZFX0NHX1BSSU5URih0c3RfY2csICJt
ZW1vcnkubWF4IiwgIiVsdSIsIFRFU1RNRU0pOwo+ID4gPiArICAgICBpZiAoVFNUX0NHX1ZFUl9J
U19WMSh0c3RfY2csICJtZW1vcnkiKSkKPiA+ID4gKyAgICAgICAgICAgICBTQUZFX0NHX1BSSU5U
Rih0c3RfY2csICJtZW1vcnkuc3dhcC5tYXgiLCAiJWx1IiwgfjBVTCk7Cj4gPiA+ICsgICAgIGVs
c2UKPiA+ID4gKyAgICAgICAgICAgICBTQUZFX0NHX1BSSU5UKHRzdF9jZywgIm1lbW9yeS5zd2Fw
Lm1heCIsICJtYXgiKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIHZvaWQgY2xlYW51
cCh2b2lkKQo+ID4gPiArewo+ID4gPiArICAgICB0c3RfZGlzYWJsZV9vb21fcHJvdGVjdGlvbigw
KTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsK
PiA+ID4gQEAgLTUxLDUgKzYxLDYgQEAgc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewo+
ID4gPiAgICAgICAuYWxsX2ZpbGVzeXN0ZW1zID0gMSwKPiA+ID4gICAgICAgLm5lZWRzX2Nncm91
cF9jdHJscyA9IChjb25zdCBjaGFyICpjb25zdCBbXSl7ICJtZW1vcnkiLCBOVUxMIH0sCj4gPiA+
ICAgICAgIC50ZXN0X2FsbCA9IHZlcmlmeV9zd2Fwb24sCj4gPiA+IC0gICAgIC5zZXR1cCA9IHNl
dHVwCj4gPiA+ICsgICAgIC5zZXR1cCA9IHNldHVwLAo+ID4gPiArICAgICAuY2xlYW51cCA9IGNs
ZWFudXAKPiA+ID4gIH07Cj4gPiA+IC0tCj4gPiA+IDIuNDAuMQo+ID4gPgo+ID4KPiA+Cj4gCj4g
LS0gCj4gUmVnYXJkcywKPiBMaSBXYW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
