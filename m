Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A5A75EC3
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Mar 2025 08:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743401606; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=BTlZZv7Wl4okMtgI0fqHRxn93f+YmyRvu4pRErWJYXY=;
 b=fMD2UC6l900woJiR5SVVGOH7Bpq8fv42xZoDhGCZMpHkkus+oFyE1Ok/qIoMt3AXlySaK
 YbmZ78wF8/Yb+LJugs3rNuYJ3rnprbTIW7qclrTCqFW/+uPNFGSICpsgmG4K6qcV+iIlAtw
 Qcv1DXr6XB5CUXvx4B5p2T6TGJVmeJ8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC20A3CAB7B
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Mar 2025 08:13:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E719A3C9ADB
 for <ltp@lists.linux.it>; Mon, 31 Mar 2025 08:13:12 +0200 (CEST)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 08C206184DC
 for <ltp@lists.linux.it>; Mon, 31 Mar 2025 08:13:08 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso2277757f8f.2
 for <ltp@lists.linux.it>; Sun, 30 Mar 2025 23:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1743401588; x=1744006388; darn=lists.linux.it;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OJws90vUp6bIJHt3kG4WYcMwiqSx+d4z9lItn+VuqiQ=;
 b=SqF8cYyjoXm9ZiDAGn6OLgPBaS3UjRKimM1GfF41WJrwr4w4m2mdhyNkbIfiBoWwZc
 udmhkdpaBa2YmfYejFwqRHFyeifBMRIcW0BCnYMpIvpdRIGjVy3pOrSDvUZ7hGoaScv2
 97WiSJ6uhgnm141E+0T4EsbB7FIBFctq0oGk8jHq25AGKQifo0F2HsFUcfqbDrA02Zbi
 IniX3NWPqlCc7DhtBvJKieVB8Bp35bojTu0uWLhD1NN6vGjZncAJK1TchisdWbA9tql8
 +bo5JpUnyHgMqL0o/D7GMoFS8/GtH1O71XeJ9b3JQlZKxAX1NB+JQsHcr49fQuJz316C
 eAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743401588; x=1744006388;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJws90vUp6bIJHt3kG4WYcMwiqSx+d4z9lItn+VuqiQ=;
 b=kxqGABx3I8VR/HF3A0k6YzRFBK6xN5aZ0aUEf8d2tkVuxOaHCWMq8CbvVQPv64mj7u
 AP22y6bU+vOmTCKeSej6N17uHAL36cu3vfYTK/6kSEBNNJe1g9EpaJPO1mzfJCFo1n5w
 WMZ/O6z/a8iUhTV5lq44gXq1800blQh7YLYVzbx9tm+/z3zFCBXIGUy3Ps/euWhoUxMh
 xGJKrP5fMCfLIORxg7AWGS8fap5F64lv3ww2MxrsFd3efjmeYNQNg7wcyBqV5v6Ad3RB
 GpB1qlxtfa1cYLeot7tUZz4+t1eBBLk6httXSF3gtnW6EhA7jgAYM+h51mrZiJZIozXh
 YmjQ==
X-Gm-Message-State: AOJu0YzI9UMbXXX9ajzWmoeqy8od1z6SCG2kaXd5s6xttLWFeFSc/xy4
 mw4z+bPFen27UX2e+bRFIpwdSqThbc6WSxT1O/AlpsO3UPOyDkCZrGYal0r2fw==
X-Gm-Gg: ASbGncu169EPGK+30Ysv5WgP8aMLGcNZMNLXpA2n3MKnXucKbqeL/uFdafT/dN4OTQd
 JyOKXa2s82jsNCCDHxcDdY5g7OkEAXE8TnJ/5I1P7HYhqTMa4oDHn4NiOWRzXHHj5dR0oXtzNLb
 SLwL2u7J2q+5Sl0G55jambaaTzBH5+QDOhTXFuHBVQl4E8EwTMvYzIfM6az7oCILGtQ/bNWG7HX
 37k+kr7zKgJKCq1dzuDUMUIUE/YELlta3Lwx88y+U+uaIDcnhyAlheuiDWFodd5ffQiBFOyHO2w
 l42jP21vZ8Xuxg3DXktfPXmiBiNIHtYkhxGs5PU=
X-Google-Smtp-Source: AGHT+IERkfi1lKA5k3/vE29CwFE0p368liV5+NQv41BfM3knrxoQKyDYbmFNTdAqIqs+v/oFx0MuYw==
X-Received: by 2002:a05:6000:402b:b0:390:f0ff:2c1c with SMTP id
 ffacd0b85a97d-39c120db3e9mr5598214f8f.18.1743401588352; 
 Sun, 30 Mar 2025 23:13:08 -0700 (PDT)
Received: from wegao ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b65b985sm10420196f8f.12.2025.03.30.23.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 23:13:08 -0700 (PDT)
Date: Mon, 31 Mar 2025 02:13:02 -0400
To: Li Wang <liwang@redhat.com>
Message-ID: <Z+oyblYPJEWdp3AJ@wegao>
References: <20250328075958.7616-1-wegao@suse.com>
 <20250331031945.5948-1-wegao@suse.com>
 <20250331031945.5948-2-wegao@suse.com>
 <CAEemH2c2WA87RcfeX1VYXYebHBcQpSP2y8umbDEnrWnaKDcApg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c2WA87RcfeX1VYXYebHBcQpSP2y8umbDEnrWnaKDcApg@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v9 1/2] cpuset02: Convert the test6 from
 cpuset_memory_testset.sh to C code
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

T24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgMDE6MDU6MzhQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBNb24sIE1hciAzMSwgMjAyNSBhdCAxMToyMOKAr0FNIFdlaSBHYW8gPHdlZ2FvQHN1c2Uu
Y29tPiB3cm90ZToKPiAKPiA+IEltcHJvdmVtZW50cyBjb21wYXJlIHdpdGggdGVzdDYgc2hlbGwg
dGVzdDoKPiA+ICogUmVtb3ZlIC9iaW4vZWNobyAkbG9hZF9iYWxhbmNlID4gJHBhdGgvY3B1c2V0
LnNjaGVkX2xvYWRfYmFsYW5jZQo+ID4gc2luY2UgdGVzdCBmb2N1cyBvbiB2ZXJpZnkgaHVnZSBw
YWdlIGlzIHJlYWxseSBhbGxvY2F0ZWQgaW4gdGhlIGNvcnJlY3QKPiA+IG5vZGUsIHRhc2sgbm8g
bmVlZCBiaW5kIHRvIHNwZWNpZmljIGNwdXNldC4KPiA+ICogRGlyZWN0bHkga2VlcCAxIGhwYWdl
IHJlc2VydmVkIGluIGVhY2ggbm9kZSBvdGhlcndpc2UgdGVzdCBjYXNlIGhhcwo+ID4gY2hhbmNl
IHRvIGZhaWwsIHNpbmNlIGBlY2hvIDEgPiAvcHJvYy9zeXMvdm0vbnJfaHVnZXBhZ2VzYCB3aWxs
IHRyeSB0bwo+ID4gcmVzZXJ2ZSAxIHBhZ2VzIGZyb20gYSBOVU1BIG5vZGUgcmFuZG9tbHkuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIEdhbyA8d2VnYW9Ac3VzZS5jb20+Cj4gPiBSZXZpZXdl
ZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4gPiBTdWdnZXN0ZWQtYnk6IExpIFdh
bmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+ID4KPiAKPiBSZXZpZXdlZC1ieTogTGkgV2FuZyA8bGl3
YW5nQHJlZGhhdC5jb20+Cj4gCj4gCj4gPiArc3RhdGljIHZvaWQgY2hpbGQodm9pZCkKPiA+ICt7
Cj4gPiArICAgICAgIGNoYXIgKnA7Cj4gPiArICAgICAgIGludCBmZF9odWdlcGFnZTsKPiA+ICsK
PiA+ICsgICAgICAgZmRfaHVnZXBhZ2UgPSBTQUZFX09QRU4oSFVHRV9QQUdFX0ZJTEUsIE9fQ1JF
QVQgfCBPX1JEV1IsIDA3NTUpOwo+ID4KPiAKPiAKPiA+ICtUU1RfRVhQX1BBU1NfU0lMRU5UKHN5
c3RlbSgiY2F0IC9wcm9jL21lbWluZm8iKSk7Cj4gPgo+IAo+IFRoaXMgbGluZSBpcyBmb3IgZGVi
dWdnaW5nIHB1cnBvc2VzLCBJIGd1ZXNzLCBhbmQgaXQgc2hvdWxkIGJlIHJlbW92ZWQgaW4KPiB0
aGUgZm9ybWFsIHBhdGNoLgpTb3JyeSwgZm9yZ2V0IHJlbW92ZSB0aGlzIGRlYnVnIGxpbmUgYWZ0
ZXIgZG9uZSBkaWZmZXJlbnQgc2NlbmFyaW8ncyB2ZXJpZmljYXRpb24uCmkgd2lsbCB3YWl0IGZv
ciBhIHdoaWxlLCBpZiBubyBtb3JlIGNvbW1lbnRzIHJlY2VpdmUgYnkgZW5kIG9mIHRvZGF5IGkg
d2lsbCB1cGRhdGUgCmFub3RoZXIgbmV3IHBhdGNoLgpUaGFua3MuCj4gCj4gCj4gLS0gCj4gUmVn
YXJkcywKPiBMaSBXYW5nCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
