Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130E90ADA5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2024 14:09:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B69063D0D4D
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2024 14:09:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2708E3CDE11
 for <ltp@lists.linux.it>; Mon, 17 Jun 2024 14:09:23 +0200 (CEST)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8578F140123D
 for <ltp@lists.linux.it>; Mon, 17 Jun 2024 14:09:22 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7979198531fso320768185a.0
 for <ltp@lists.linux.it>; Mon, 17 Jun 2024 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718626161; x=1719230961; darn=lists.linux.it;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjnEoquzo9Lk2KRmH+XQyjN0aGvb5l6weKjYhKoEUUk=;
 b=Lo9DXLo+C+Hp2r3ieS9Wf4LLk/hdnYY3GIaLD59ymhW6ld8ba0cxggEmDYrJTO3Na/
 +GWLqHzkB63+iVH6XR2fGoCQ1bdp6YBAVdObGHdHpG2x1LNb3ctH+bQo2Cs0Q3TcPQwH
 3rg2WMuoCIvpRIVA5KNy3tUaMvOfROT3htDEyNrS0scQYVKVySxW2+X2xRYnC9p3F7Vz
 JsjXvrw7oHzhAio+v/pLc0Id9Q76PWdIGgL/6F6gEP197vV6I/LQjj9vV/VboU6raphx
 IMGI6Rt+Dwmn7TGcoYCQ0Aa+D5/sekK0Hfz1H34KXHRlC5gxxgGqrx+2MF6lTGFJ8iAN
 5F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718626161; x=1719230961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjnEoquzo9Lk2KRmH+XQyjN0aGvb5l6weKjYhKoEUUk=;
 b=bJBCrJCJE2xyR+xQ405e8ye5rDDmT4Q5Q1uTt5H9Dl8AmkspVziNMtzBMOJd+BolHl
 0u3ylQkZb9QchVJvMyRoXDUJNUi+yHvQhQhEzaAp6qPRcU8iRMvJGnm/bj5kU/SFeDFe
 AOnGI1ah0DAtDx6b3KR1dR65hxI4dmRMqGaqJAWTZyBxO7fZi7x06ZBtlS01hAjPouVl
 z5CHDplKb6iqg4pP/lXN0l183ADgVUkezjRToYqtn5MyEIw/9TcRC+TslLtn8y6s7L2o
 CIecWv2TPFIXm5fQGua0VCDXjaZ5GRdNXi2Xw6ZHwSnfkcXnLRdCa6pItFRcOoBVMiKL
 Dlig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2n0V/NT0TZCDNEIbM84+vjYLQT/bPqi0BBpiavqqT4LWluZBz5LKT8k7Ud3IE65BbQbtnGKdpZ9hlapeBCl1KRPI=
X-Gm-Message-State: AOJu0YxYnJ6TsmlUAKy76iuO+st/LCJhQFbAeWzR+sONLnodqziXfujI
 vzc4mZTp2RNoFZsCSa+gUaEvxwtM3Ryr/yh1trAt1mOEMwuJFfGT9MEcp6xQ9zO8uziZYsrZZRY
 gI6HxQxYMnOcrJLHAJPgfJe7YKSE=
X-Google-Smtp-Source: AGHT+IGC6gJTPFUpeTBWZHvXEWPldOelBDHsw67xc0ymSDYjHFSPBn6kpD8WkNTjHbWBLj3NLVjUB4bhKcNwPIPO0bU=
X-Received: by 2002:a05:620a:1927:b0:795:4e07:833 with SMTP id
 af79cd13be357-798d26b4a6fmr1074839885a.71.1718626161127; Mon, 17 Jun 2024
 05:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <171817619547.14261.975798725161704336@noble.neil.brown.name>
 <20240615-fahrrad-bauordnung-a349bacd8c82@brauner>
 <20240617093745.nhnc7e7efdldnjzl@quack3>
In-Reply-To: <20240617093745.nhnc7e7efdldnjzl@quack3>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 17 Jun 2024 15:09:09 +0300
Message-ID: <CAOQ4uxiN3JnH-oJTw63rTR_B8oPBfB7hWyun0Hsb3ZX3AORf2g@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] VFS: generate FS_CREATE before FS_OPEN when
 ->atomic_open used.
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
Cc: Christian Brauner <brauner@kernel.org>, NeilBrown <neilb@suse.de>,
 linux-nfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMTI6MzfigK9QTSBKYW4gS2FyYSA8amFja0BzdXNlLmN6
PiB3cm90ZToKPgo+IE9uIFNhdCAxNS0wNi0yNCAwNzozNTo0MiwgQ2hyaXN0aWFuIEJyYXVuZXIg
d3JvdGU6Cj4gPiBPbiBXZWQsIDEyIEp1biAyMDI0IDE3OjA5OjU1ICsxMDAwLCBOZWlsQnJvd24g
d3JvdGU6Cj4gPiA+IFdoZW4gYSBmaWxlIGlzIG9wZW5lZCBhbmQgY3JlYXRlZCB3aXRoIG9wZW4o
Li4uLCBPX0NSRUFUKSB3ZSBnZXQKPiA+ID4gYm90aCB0aGUgQ1JFQVRFIGFuZCBPUEVOIGZzbm90
aWZ5IGV2ZW50cyBhbmQgd291bGQgZXhwZWN0IHRoZW0gaW4gdGhhdAo+ID4gPiBvcmRlci4gICBG
b3IgbW9zdCBmaWxlc3lzdGVtcyB3ZSBnZXQgdGhlbSBpbiB0aGF0IG9yZGVyIGJlY2F1c2UKPiA+
ID4gb3Blbl9sYXN0X2xvb2t1cHMoKSBjYWxscyBmc25vZmlmeV9jcmVhdGUoKSBhbmQgdGhlbiBk
b19vcGVuKCkgKGZyb20KPiA+ID4gcGF0aF9vcGVuYXQoKSkgY2FsbHMgdmZzX29wZW4oKS0+ZG9f
ZGVudHJ5X29wZW4oKSB3aGljaCBjYWxscwo+ID4gPiBmc25vdGlmeV9vcGVuKCkuCj4gPiA+Cj4g
PiA+IFsuLi5dCj4gPgo+ID4gQXBwbGllZCB0byB0aGUgdmZzLmZpeGVzIGJyYW5jaCBvZiB0aGUg
dmZzL3Zmcy5naXQgdHJlZS4KPiA+IFBhdGNoZXMgaW4gdGhlIHZmcy5maXhlcyBicmFuY2ggc2hv
dWxkIGFwcGVhciBpbiBsaW51eC1uZXh0IHNvb24uCj4gPgo+ID4gUGxlYXNlIHJlcG9ydCBhbnkg
b3V0c3RhbmRpbmcgYnVncyB0aGF0IHdlcmUgbWlzc2VkIGR1cmluZyByZXZpZXcgaW4gYQo+ID4g
bmV3IHJldmlldyB0byB0aGUgb3JpZ2luYWwgcGF0Y2ggc2VyaWVzIGFsbG93aW5nIHVzIHRvIGRy
b3AgaXQuCj4gPgo+ID4gSXQncyBlbmNvdXJhZ2VkIHRvIHByb3ZpZGUgQWNrZWQtYnlzIGFuZCBS
ZXZpZXdlZC1ieXMgZXZlbiB0aG91Z2ggdGhlCj4gPiBwYXRjaCBoYXMgbm93IGJlZW4gYXBwbGll
ZC4gSWYgcG9zc2libGUgcGF0Y2ggdHJhaWxlcnMgd2lsbCBiZSB1cGRhdGVkLgo+ID4KPiA+IE5v
dGUgdGhhdCBjb21taXQgaGFzaGVzIHNob3duIGJlbG93IGFyZSBzdWJqZWN0IHRvIGNoYW5nZSBk
dWUgdG8gcmViYXNlLAo+ID4gdHJhaWxlciB1cGRhdGVzIG9yIHNpbWlsYXIuIElmIGluIGRvdWJ0
LCBwbGVhc2UgY2hlY2sgdGhlIGxpc3RlZCBicmFuY2guCj4gPgo+ID4gdHJlZTogICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92ZnMvdmZzLmdpdAo+ID4g
YnJhbmNoOiB2ZnMuZml4ZXMKPiA+Cj4gPiBbMS8xXSBWRlM6IGdlbmVyYXRlIEZTX0NSRUFURSBi
ZWZvcmUgRlNfT1BFTiB3aGVuIC0+YXRvbWljX29wZW4gdXNlZC4KPiA+ICAgICAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvdmZzL3Zmcy9jLzc1MzZiMmYwNjcyNAo+Cj4gSSBoYXZlIHJldmlld2Vk
IHRoZSBwYXRjaCB5b3UndmUgY29tbWl0dGVkIHNpbmNlIEkgd2Fzbid0IHF1aXRlIHN1cmUgd2hp
Y2gKPiBjaGFuZ2VzIHlvdSdyZSBnb2luZyB0byBhcHBseSBhZnRlciB5b3VyIGRpc2N1c3Npb24g
d2l0aCBBbWlyLiBBbmQgSSBoYXZlCj4gdHdvIGNvbW1lbnRzOgo+Cj4gQEAgLTEwODUsOCArMTA4
MCwxNyBAQCBFWFBPUlRfU1lNQk9MKGZpbGVfcGF0aCk7Cj4gICAqLwo+ICBpbnQgdmZzX29wZW4o
Y29uc3Qgc3RydWN0IHBhdGggKnBhdGgsIHN0cnVjdCBmaWxlICpmaWxlKQo+ICB7Cj4gKyAgICAg
ICBpbnQgcmV0Owo+ICsKPiAgICAgICAgIGZpbGUtPmZfcGF0aCA9ICpwYXRoOwo+IC0gICAgICAg
cmV0dXJuIGRvX2RlbnRyeV9vcGVuKGZpbGUsIE5VTEwpOwo+ICsgICAgICAgcmV0ID0gZG9fZGVu
dHJ5X29wZW4oZmlsZSwgTlVMTCk7Cj4gKyAgICAgICBpZiAoIXJldCkKPiArICAgICAgICAgICAg
ICAgLyoKPiArICAgICAgICAgICAgICAgICogT25jZSB3ZSByZXR1cm4gYSBmaWxlIHdpdGggRk1P
REVfT1BFTkVELCBfX2ZwdXQoKSB3aWxsIGNhbGwKPiArICAgICAgICAgICAgICAgICogZnNub3Rp
ZnlfY2xvc2UoKSwgc28gd2UgbmVlZCBmc25vdGlmeV9vcGVuKCkgaGVyZSBmb3Igc3ltbWV0cnku
Cj4gKyAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBmc25vdGlmeV9vcGVuKGZp
bGUpOwoKUGxlYXNlIGFkZCB7IH0gYXJvdW5kIG11bHRpIGxpbmUgaW5kZW50ZWQgdGV4dC4KCj4g
KyAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiBBRkFJQ1QgdGhpcyB3aWxsIGhhdmUgYSBzaWRl
LWVmZmVjdCB0aGF0IG5vdyBmc25vdGlmeV9vcGVuKCkgd2lsbCBiZQo+IGdlbmVyYXRlZCBldmVu
IGZvciBPX1BBVEggb3Blbi4gSXQgaXMgdHJ1ZSB0aGF0IGZzbm90aWZ5X2Nsb3NlKCkgaXMgZ2V0
dGluZwo+IGdlbmVyYXRlZCBmb3IgdGhlbSBhbHJlYWR5IGFuZCB3ZSBzaG91bGQgc3RyaXZlIGZv
ciBzeW1tZXRyeS4gQ29uY2VwdHVhbGx5Cj4gaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lIHRv
IGdlbmVyYXRlIGZzbm90aWZ5IGV2ZW50cyBmb3IgT19QQVRICj4gb3BlbnMvY2xvc2VzIGJ1dCBt
YXliZSBJIG1pc3Mgc29tZXRoaW5nLiBBbWlyLCBhbnkgb3BpbmlvbiBoZXJlPwoKR29vZCBjYXRj
aCEKCkkgYWdyZWUgdGhhdCB3ZSBkbyBub3QgbmVlZCBPUEVOIG5vciBDTE9TRSBldmVudHMgZm9y
IE9fUEFUSC4KSSBzdWdnZXN0IHRvIHNvbHZlIGl0IHdpdGg6CgpAQCAtOTE1LDcgKzkyOSw3IEBA
IHN0YXRpYyBpbnQgZG9fZGVudHJ5X29wZW4oc3RydWN0IGZpbGUgKmYsCiAgICAgICAgZi0+Zl9z
Yl9lcnIgPSBmaWxlX3NhbXBsZV9zYl9lcnIoZik7CgogICAgICAgIGlmICh1bmxpa2VseShmLT5m
X2ZsYWdzICYgT19QQVRIKSkgewotICAgICAgICAgICAgICAgZi0+Zl9tb2RlID0gRk1PREVfUEFU
SCB8IEZNT0RFX09QRU5FRDsKKyAgICAgICAgICAgICAgIGYtPmZfbW9kZSA9IEZNT0RFX1BBVEgg
fCBGTU9ERV9PUEVORUQgfCBfX0ZNT0RFX05PTk9USUZZOwogICAgICAgICAgICAgICAgZi0+Zl9v
cCA9ICZlbXB0eV9mb3BzOwogICAgICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgfQoKPgo+
IEBAIC0zNjEyLDYgKzM2MTIsOSBAQCBzdGF0aWMgaW50IGRvX29wZW4oc3RydWN0IG5hbWVpZGF0
YSAqbmQsCj4gICAgICAgICBpbnQgYWNjX21vZGU7Cj4gICAgICAgICBpbnQgZXJyb3I7Cj4KPiAr
ICAgICAgIGlmIChmaWxlLT5mX21vZGUgJiBGTU9ERV9PUEVORUQpCj4gKyAgICAgICAgICAgICAg
IGZzbm90aWZ5X29wZW4oZmlsZSk7Cj4gKwo+ICAgICAgICAgaWYgKCEoZmlsZS0+Zl9tb2RlICYg
KEZNT0RFX09QRU5FRCB8IEZNT0RFX0NSRUFURUQpKSkgewo+ICAgICAgICAgICAgICAgICBlcnJv
ciA9IGNvbXBsZXRlX3dhbGsobmQpOwo+ICAgICAgICAgICAgICAgICBpZiAoZXJyb3IpCj4KPiBG
cmFua2x5LCB0aGlzIHdvcmtzIGJ1dCBsb29rcyBhcyBhbiBvZGQgcGxhY2UgdG8gcHV0IHRoaXMg
bm90aWZpY2F0aW9uIHRvLgo+IFdoeSBub3QganVzdCBwbGFjaW5nIGl0IGp1c3QgbmV4dCB0byB3
aGVyZSBmc25vdGlmeV9jcmVhdGUoKSBpcyBnZW5lcmF0ZWQKPiBpbiBvcGVuX2xhc3RfbG9va3Vw
cygpPyBMaWtlOgo+Cj4gICAgICAgICBpZiAob3Blbl9mbGFnICYgT19DUkVBVCkKPiAgICAgICAg
ICAgICAgICAgaW5vZGVfbG9jayhkaXItPmRfaW5vZGUpOwo+ICAgICAgICAgZWxzZQo+ICAgICAg
ICAgICAgICAgICBpbm9kZV9sb2NrX3NoYXJlZChkaXItPmRfaW5vZGUpOwo+ICAgICAgICAgZGVu
dHJ5ID0gbG9va3VwX29wZW4obmQsIGZpbGUsIG9wLCBnb3Rfd3JpdGUpOwo+IC0gICAgICAgaWYg
KCFJU19FUlIoZGVudHJ5KSAmJiAoZmlsZS0+Zl9tb2RlICYgRk1PREVfQ1JFQVRFRCkpCj4gLSAg
ICAgICAgICAgICAgIGZzbm90aWZ5X2NyZWF0ZShkaXItPmRfaW5vZGUsIGRlbnRyeSk7Cj4gKyAg
ICAgICBpZiAoIUlTX0VSUihkZW50cnkpKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChmaWxlLT5m
X21vZGUgJiBGTU9ERV9DUkVBVEVEKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZzbm90aWZ5
X2NyZWF0ZShkaXItPmRfaW5vZGUsIGRlbnRyeSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChmaWxl
LT5mX21vZGUgJiBGTU9ERV9PUEVORUQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZnNub3Rp
Znlfb3BlbihmaWxlKTsKPiArICAgICAgIH0KPiAgICAgICAgIGlmIChvcGVuX2ZsYWcgJiBPX0NS
RUFUKQo+ICAgICAgICAgICAgICAgICBpbm9kZV91bmxvY2soZGlyLT5kX2lub2RlKTsKPiAgICAg
ICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgaW5vZGVfdW5sb2NrX3NoYXJlZChkaXItPmRfaW5v
ZGUpOwo+Cj4gVGhhdCBsb29rcyBsaWtlIGEgcGxhY2Ugd2hlcmUgaXQgaXMgbXVjaCBtb3JlIG9i
dmlvdXMgdGhpcyBpcyBmb3IKPiBhdG9taWNfb3BlbigpIGhhbmRsaW5nPyBOb3cgSSBhZG1pdCBJ
J20gbm90IHJlYWxseSBjbG9zZWx5IGZhbWlsaWFyIHdpdGgKPiB0aGUgYXRvbWljX29wZW4oKSBw
YXRocyBzbyBtYXliZSBJIG1pc3Mgc29tZXRoaW5nIGFuZCBkb19vcGVuKCkgaXMgYmV0dGVyLgoK
SXQgbG9va3MgbmljZSwgYnV0IEkgdGhpbmsgaXQgaXMgbWlzc2luZyB0aGUgZmFzdCBsb29rdXAg
Y2FzZSB3aXRob3V0IE9fQ1JFQVQKKGkuZS4gZ290byBmaW5pc2hfbG9va3VwKS4KClRoYW5rcywK
QW1pci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
