Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770A17EB49
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 22:35:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDCD83C6169
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 22:35:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 519083C0E94
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 17:42:12 +0100 (CET)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 81E7D60121E
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 17:42:11 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id 6so12091625wre.4
 for <ltp@lists.linux.it>; Mon, 09 Mar 2020 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KuLNvzeyVvGLltHx3+bbVL+qtfjLzeaJ7yeN666G1fU=;
 b=z2eyDqZRLNbUpP54DzfIV8NCQxaah5XHM9s2kmGal5EYOiHNGQyXCbP7AokJG/33pg
 NH5MaupO2Ievn6ILP+ve+prpq85jDd/6qydVFwGmQwlMYfdb3T2CBDlv9ckZMlxQQV59
 K6wByiHaqSlnEpD6+h5dlhXXOxH6m78SdkBIcbYE2BQ54TghA7HL1Zu0ZYNxGq8Dpv1s
 4R0MlAvxKQALbTDfkB4XFb9o5FQi2yD4pfACAC5WAU1b4Uadyj6XKN7P4oo/QKJHurlb
 DxFxpmAJhq/OO5lmgquRc0xAX+pdAiAtcUBFJWoHihBtmtadQbKB+NzlaRDSqIAUSmAV
 RYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KuLNvzeyVvGLltHx3+bbVL+qtfjLzeaJ7yeN666G1fU=;
 b=nln89txkQ2HZSCa8qlTf1lIY4mLKlSn/fMgtJPbADDjfZBz1pY98cAhGLnlp6hqr05
 XIjYh18FmExOz3iJ35uDAOYHvqkfN/4Itx+tpFH16siqWHnkm2Ucl1FEZz6zw9oZTm3s
 43ALc1T9ojdicxP9TYsUXeS4VXwefMUllg5GiL6JzEGIuLOqqo0C9PbuO0DXnC+cLt4k
 GJOLjR5wRP93LinUCSwb5xhX00pA6iMg+GA8HRl/PY/WBpS4CpvFe1vxqNFf0eQ8NDnF
 sg+hkF3MsjPTSaMVWEpXa+Px2tp+W0+yMtVcLDi6tZBW5ZPWcjtHEVguSEdRPH45hHg5
 KK+A==
X-Gm-Message-State: ANhLgQ2FAkMuV002bPc7X6T+BMWl44lobXIBvW/mM4K22M2fO2+rkyFq
 gCAkI2wdVtZzGeJGfgwq4iG9EQ==
X-Google-Smtp-Source: ADFU+vuQnaOtd59I963CnI/l0FrOXWVOeQ76ezi4bnOW5eohiIgR0DWvnMX5AKi00d9mfbF5/iBp7g==
X-Received: by 2002:a5d:5681:: with SMTP id f1mr9546462wrv.137.1583772130831; 
 Mon, 09 Mar 2020 09:42:10 -0700 (PDT)
Received: from [192.168.0.102] (88-147-36-163.dyn.eolo.it. [88.147.36.163])
 by smtp.gmail.com with ESMTPSA id e22sm96498wme.45.2020.03.09.09.42.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2020 09:42:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <ba09351f-0a5a-824a-dbf2-021360581cd7@redhat.com>
Date: Mon, 9 Mar 2020 17:42:17 +0100
Message-Id: <86A42362-D355-4885-AC68-B43E46FBB109@linaro.org>
References: <cki.FEFA879F6B.TFTZ93YIF0@redhat.com>
 <ba09351f-0a5a-824a-dbf2-021360581cd7@redhat.com>
To: Rachel Sibley <rasibley@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 09 Mar 2020 22:35:52 +0100
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E6?=
 =?utf-8?q?=2E0-rc4-61a0925=2Ecki_=28mainline=2Ekernel=2Eorg=29?=
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
 linux-block <linux-block@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUmFjaGVsLApJSVVDLCB5b3UgY2FuIHJlcHJvZHVjZSB0aGlzIGJ1ZyByZWxpYWJseS4gSWYg
c28sIEknZCBuZWVkIHlvdSB0byB0ZXN0IGEgZGVidWdnaW5nIHBhdGNoIChvbiB0b3Agb2Ygb25l
IG9mIHRoZSBvZmZlbmRpbmcga2VybmVscykuCgpMb29raW5nIGZvcndhcmQgdG8geW91ciBmZWVk
YmFjaywKUGFvbG8KCj4gSWwgZ2lvcm5vIDkgbWFyIDIwMjAsIGFsbGUgb3JlIDE1OjI3LCBSYWNo
ZWwgU2libGV5IDxyYXNpYmxleUByZWRoYXQuY29tPiBoYSBzY3JpdHRvOgo+IAo+IChjYydpbmcg
bGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnKQo+IAo+IEhlbGxvLAo+IAo+IFdlIGFyZSBzZWVp
bmcgYSBrZXJuZWwgcGFuaWMgdHJpZ2dlcmVkIHdpdGggTFRQIGFuZCB4ZnN0ZXN0cyBhZ2FpbnN0
IGEgcmVjZW50IGNvbW1pdCBmb3IgbWFpbmxpbmUsCj4gd2FudGVkIHRvIHNoYXJlIGluIGNhc2Ug
aXQncyBub3QgYWxyZWFkeSBrbm93bi4KPiAKPiBLZXJuZWwgcmVwbzogaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0Cj4gQ29t
bWl0OiA2MWEwOTI1OGYyZTUgLSBNZXJnZSB0YWcgJ2Zvci1saW51cycgb2YgZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3JkbWEvcmRtYQo+IAo+IFdlIGhhdmUg
YWxzbyBzZWVuIGl0IHdpdGggMmM1MjNiMzQ0ZGZhIGFuZCAzNzhmZWUyZTZiMTIgY29tbWl0cyBh
cyB3ZWxsLgo+IAo+IExUUDogaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6
b25hd3MuY29tL2RhdGF3YXJlaG91c2UvMjAyMC8wMy8wOC80Nzc0NjkveDg2XzY0XzFfY29uc29s
ZS5sb2cKPiB4ZnN0ZXN0czogaHR0cHM6Ly9ja2ktYXJ0aWZhY3RzLnMzLnVzLWVhc3QtMi5hbWF6
b25hd3MuY29tL2RhdGF3YXJlaG91c2UvMjAyMC8wMy8wOC80Nzc0NjkveDg2XzY0XzRfY29uc29s
ZS5sb2cKPiAKPiBbLS0gTUFSSyAtLSBTdW4gTWFyICA4IDAyOjQ1OjAwIDIwMjBdCj4gWyAgNzYy
LjMxNTYxMF0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAw
MDAwMDAwMDAwMDAwMTU4Cj4gWyAgNzYyLjMyMzM4NV0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNj
ZXNzIGluIGtlcm5lbCBtb2RlCj4gWyAgNzYyLjMyOTExOV0gI1BGOiBlcnJvcl9jb2RlKDB4MDAw
MCkgLSBub3QtcHJlc2VudCBwYWdlCj4gWyAgNzYyLjMzNDg1M10gUEdEIDAgUDREIDAKPiBbICA3
NjIuMzM3NjgwXSBPb3BzOiAwMDAwIFsjMV0gU01QIFBUSQo+IFsgIDc2Mi4zNDE1NzVdIENQVTog
OSBQSUQ6IDg3IENvbW06IGt3b3JrZXIvOToxIE5vdCB0YWludGVkIDUuNi4wLXJjNC02MWEwOTI1
LmNraSAjMQo+IFsgIDc2Mi4zNDk5MjddIEhhcmR3YXJlIG5hbWU6IENpc2NvIFN5c3RlbXMsIElu
Yy4gVUNTLUUxNjBEUC1NMS9LOS9VQ1MtRTE2MERQLU0xL0s5LCBCSU9TIFVDU0VELjEuNS4wLjIu
MDUxNTIwMTMxNzU3IDA1LzE1LzIwMTMKPiBbICA3NjIuMzYyNDUzXSBXb3JrcXVldWU6IGNncm91
cF9kZXN0cm95IGNzc19raWxsZWRfd29ya19mbgo+IFsgIDc2Mi4zNjgzODddIFJJUDogMDAxMDpi
ZnFfYmZxcV9leHBpcmUrMHgxYy8weDk0MAo+IFsgIDc2Mi4zNzM1NDBdIENvZGU6IDAxIDAwIDAw
IGM3IDgwIGY4IDAwIDAwIDAwIDAxIDAwIDAwIDAwIGMzIDY2IDY2IDY2IDY2IDkwIDQxIDU3IDQx
IDU2IDQxIDU1IDQxIDU0IDQxIDg5IGNjIDU1IDQ4IDg5IGZkIDUzIDQ4IDg5IGYzIDQ4IDgzIGVj
IDI4IDw4Yj4gYmUgNTggMDEgMDAgMDAgNjUgNDggOGIgMDQgMjUgMjggMDAgMDAgMDAgNDggODkg
NDQgMjQgMjAgMzEgYzAKPiBbICA3NjIuMzk0NTAwXSBSU1A6IDAwMTg6ZmZmZjk5MjdjMDNiYmQ1
MCBFRkxBR1M6IDAwMDEwMDg2Cj4gWyAgNzYyLjQwMDMzMV0gUkFYOiAwMDAwMDAwMDAwMDAwMDAw
IFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6IDAwMDAwMDAwMDAwMDAwMDQKPiBbICA3NjIuNDA4
MzAxXSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogZmZm
Zjg5NjVhMzkxMzgwMAo+IFsgIDc2Mi40MTYyNzBdIFJCUDogZmZmZjg5NjVhMzkxMzgwMCBSMDg6
IGZmZmY4OTY1OTJkNDEwOTggUjA5OiBmZmZmODk2NTdhYThkZjAwCj4gWyAgNzYyLjQyNDIzM10g
UjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogZmZmZjg5NjU3YWE4ZGYwMCBSMTI6IDAwMDAwMDAw
MDAwMDAwMDQKPiBbICA3NjIuNDMyMjAwXSBSMTM6IGZmZmY4OTY1OWYwY2Q5YjAgUjE0OiBmZmZm
ODk2NWEzOTEzYmYwIFIxNTogZmZmZjg5NjU5ZjBjZDg5OAo+IFsgIDc2Mi40NDAxNzVdIEZTOiAg
MDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmODk2NWE3YzQwMDAwKDAwMDApIGtubEdTOjAw
MDAwMDAwMDAwMDAwMDAKPiBbICA3NjIuNDQ5MjExXSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gWyAgNzYyLjQ1NTYyMl0gQ1IyOiAwMDAwMDAwMDAw
MDAwMTU4IENSMzogMDAwMDAwMDY1YWZjNjAwMyBDUjQ6IDAwMDAwMDAwMDAwNjA2ZTAKPiBbICA3
NjIuNDYzNTk5XSBDYWxsIFRyYWNlOgo+IFsgIDc2Mi40NjYzNDFdICA/IGJmcV9pZGxlX2V4dHJh
Y3QrMHg0MC8weGIwCj4gWyAgNzYyLjQ3MDgyMV0gIGJmcV9iZnFxX21vdmUrMHgxNGYvMHgxNjAK
PiBbICA3NjIuNDc1MDExXSAgYmZxX3BkX29mZmxpbmUrMHhkMy8weGYwCj4gWyAgNzYyLjQ3OTEx
Ml0gIGJsa2dfZGVzdHJveSsweDUyLzB4ZjAKPiBbICA3NjIuNDgzMDA1XSAgYmxrY2dfZGVzdHJv
eV9ibGtncysweDRmLzB4YTAKPiBbICA3NjIuNDg3NTgyXSAgY3NzX2tpbGxlZF93b3JrX2ZuKzB4
NGQvMHhkMAo+IFsgIDc2Mi40OTIwNjZdICBwcm9jZXNzX29uZV93b3JrKzB4MWI1LzB4MzYwCj4g
WyAgNzYyLjQ5NjU0N10gIHdvcmtlcl90aHJlYWQrMHg1MC8weDNjMAo+IFsgIDc2Mi41MDA2NDFd
ICBrdGhyZWFkKzB4ZjkvMHgxMzAKPiBbICA3NjIuNTA0MTUzXSAgPyBwcm9jZXNzX29uZV93b3Jr
KzB4MzYwLzB4MzYwCj4gWyAgNzYyLjUwODgxM10gID8ga3RocmVhZF9wYXJrKzB4OTAvMHg5MAo+
IFsgIDc2Mi41MTI5MDldICByZXRfZnJvbV9mb3JrKzB4MzUvMHg0MAo+IAo+IFRoYW5rcywKPiBS
YWNoZWwKPiAKPiBPbiAzLzcvMjAgOTo1OSBQTSwgQ0tJIFByb2plY3Qgd3JvdGU6Cj4+IEhlbGxv
LAo+PiBXZSByYW4gYXV0b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMg
a2VybmVsIHRyZWU6Cj4+ICAgICAgICBLZXJuZWwgcmVwbzogaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0Cj4+ICAgICAgICAg
ICAgIENvbW1pdDogNjFhMDkyNThmMmU1IC0gTWVyZ2UgdGFnICdmb3ItbGludXMnIG9mIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yZG1hL3JkbWEKPj4gVGhl
IHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KPj4g
ICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+PiAgICAgICAg
ICAgICAgTWVyZ2U6IE9LCj4+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPj4gICAgICAgICAgICAg
IFRlc3RzOiBGQUlMRUQKPj4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQg
bG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+PiAgIGh0dHBzOi8vY2tpLWFy
dGlmYWN0cy5zMy51cy1lYXN0LTIuYW1hem9uYXdzLmNvbS9pbmRleC5odG1sP3ByZWZpeD1kYXRh
d2FyZWhvdXNlLzIwMjAvMDMvMDgvNDc3NDY5Cj4+IE9uZSBvciBtb3JlIGtlcm5lbCB0ZXN0cyBm
YWlsZWQ6Cj4+ICAgICB4ODZfNjQ6Cj4+ICAgICAg4p2MIExUUAo+PiAgICAgIOKdjCB4ZnN0ZXN0
cyAtIGV4dDQKPj4gV2UgaG9wZSB0aGF0IHRoZXNlIGxvZ3MgY2FuIGhlbHAgeW91IGZpbmQgdGhl
IHByb2JsZW0gcXVpY2tseS4gRm9yIHRoZSBmdWxsCj4+IGRldGFpbCBvbiBvdXIgdGVzdGluZyBw
cm9jZWR1cmVzLCBwbGVhc2Ugc2Nyb2xsIHRvIHRoZSBib3R0b20gb2YgdGhpcyBtZXNzYWdlLgo+
PiBQbGVhc2UgcmVwbHkgdG8gdGhpcyBlbWFpbCBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIGFi
b3V0IHRoZSB0ZXN0cyB0aGF0IHdlCj4+IHJhbiBvciBpZiB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlv
bnMgb24gaG93IHRvIG1ha2UgZnV0dXJlIHRlc3RzIG1vcmUgZWZmZWN0aXZlLgo+PiAgICAgICAg
ICwtLiAgICwtLgo+PiAgICAgICAgKCBDICkgKCBLICkgIENvbnRpbnVvdXMKPj4gICAgICAgICBg
LScsLS5gLScgICBLZXJuZWwKPj4gICAgICAgICAgICggSSApICAgICBJbnRlZ3JhdGlvbgo+PiAg
ICAgICAgICAgIGAtJwo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gQ29tcGlsZSB0ZXN0aW5n
Cj4+IC0tLS0tLS0tLS0tLS0tLQo+PiBXZSBjb21waWxlZCB0aGUga2VybmVsIGZvciAxIGFyY2hp
dGVjdHVyZToKPj4gICAgIHg4Nl82NDoKPj4gICAgICAgbWFrZSBvcHRpb25zOiAtajMwIElOU1RB
TExfTU9EX1NUUklQPTEgdGFyZ3otcGtnCj4+IEhhcmR3YXJlIHRlc3RpbmcKPj4gLS0tLS0tLS0t
LS0tLS0tLQo+PiBXZSBib290ZWQgZWFjaCBrZXJuZWwgYW5kIHJhbiB0aGUgZm9sbG93aW5nIHRl
c3RzOgo+PiAgIHg4Nl82NDoKPj4gICAgIEhvc3QgMToKPj4gICAgICAgIOKchSBCb290IHRlc3QK
Pj4gICAgICAgIOKchSBQb2RtYW4gc3lzdGVtIGludGVncmF0aW9uIHRlc3QgLSBhcyByb290Cj4+
ICAgICAgICDinIUgUG9kbWFuIHN5c3RlbSBpbnRlZ3JhdGlvbiB0ZXN0IC0gYXMgdXNlcgo+PiAg
ICAgICAg4p2MIExUUAo+PiAgICAgICAg4pqh4pqh4pqhIExvb3BkZXYgU2FuaXR5Cj4+ICAgICAg
ICDimqHimqHimqEgTWVtb3J5IGZ1bmN0aW9uOiBtZW1mZF9jcmVhdGUKPj4gICAgICAgIOKaoeKa
oeKaoSBBTVRVIChBYnN0cmFjdCBNYWNoaW5lIFRlc3QgVXRpbGl0eSkKPj4gICAgICAgIOKaoeKa
oeKaoSBOZXR3b3JraW5nIGJyaWRnZTogc2FuaXR5Cj4+ICAgICAgICDimqHimqHimqEgRXRoZXJu
ZXQgZHJpdmVycyBzYW5pdHkKPj4gICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIE1BQ3NlYzog
c2FuaXR5Cj4+ICAgICAgICDimqHimqHimqEgTmV0d29ya2luZyBzb2NrZXQ6IGZ1enoKPj4gICAg
ICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIHNjdHAtYXV0aDogc29ja29wdHMgdGVzdAo+PiAgICAg
ICAg4pqh4pqh4pqhIE5ldHdvcmtpbmc6IGlnbXAgY29uZm9ybWFuY2UgdGVzdAo+PiAgICAgICAg
4pqh4pqh4pqhIE5ldHdvcmtpbmcgcm91dGU6IHBtdHUKPj4gICAgICAgIOKaoeKaoeKaoSBOZXR3
b3JraW5nIHJvdXRlX2Z1bmMgLSBsb2NhbAo+PiAgICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcg
cm91dGVfZnVuYyAtIGZvcndhcmQKPj4gICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIFRDUDog
a2VlcGFsaXZlIHRlc3QKPj4gICAgICAgIOKaoeKaoeKaoSBOZXR3b3JraW5nIFVEUDogc29ja2V0
Cj4+ICAgICAgICDimqHimqHimqEgTmV0d29ya2luZyB0dW5uZWw6IGdlbmV2ZSBiYXNpYyB0ZXN0
Cj4+ICAgICAgICDimqHimqHimqEgTmV0d29ya2luZyB0dW5uZWw6IGdyZSBiYXNpYwo+PiAgICAg
ICAg4pqh4pqh4pqhIEwyVFAgYmFzaWMgdGVzdAo+PiAgICAgICAg4pqh4pqh4pqhIE5ldHdvcmtp
bmcgdHVubmVsOiB2eGxhbiBiYXNpYwo+PiAgICAgICAg4pqh4pqh4pqhIE5ldHdvcmtpbmcgaXBz
ZWM6IGJhc2ljIG5ldG5zIC0gdHJhbnNwb3J0Cj4+ICAgICAgICDimqHimqHimqEgTmV0d29ya2lu
ZyBpcHNlYzogYmFzaWMgbmV0bnMgLSB0dW5uZWwKPj4gICAgICAgIOKaoeKaoeKaoSBhdWRpdDog
YXVkaXQgdGVzdHN1aXRlIHRlc3QKPj4gICAgICAgIOKaoeKaoeKaoSBodHRwZDogbW9kX3NzbCBz
bW9rZSBzYW5pdHkKPj4gICAgICAgIOKaoeKaoeKaoSB0dW5lZDogdHVuZS1wcm9jZXNzZXMtdGhy
b3VnaC1wZXJmCj4+ICAgICAgICDimqHimqHimqEgcGNpdXRpbHM6IHNhbml0eSBzbW9rZSB0ZXN0
Cj4+ICAgICAgICDimqHimqHimqEgQUxTQSBQQ00gbG9vcGJhY2sgdGVzdAo+PiAgICAgICAg4pqh
4pqh4pqhIEFMU0EgQ29udHJvbCAobWl4ZXIpIFVzZXJzcGFjZSBFbGVtZW50IHRlc3QKPj4gICAg
ICAgIOKaoeKaoeKaoSBzdG9yYWdlOiBTQ1NJIFZQRAo+PiAgICAgICAg4pqh4pqh4pqhIHRyYWNl
OiBmdHJhY2UvdHJhY2VyCj4+ICAgICAgICDwn5qnIOKaoeKaoeKaoSBDSUZTIENvbm5lY3RhdGhv
bgo+PiAgICAgICAg8J+apyDimqHimqHimqEgUE9TSVggcGpkLWZzdGVzdCBzdWl0ZXMKPj4gICAg
ICAgIPCfmqcg4pqh4pqh4pqhIGp2bSAtIERhQ2FwbyBCZW5jaG1hcmsgU3VpdGUKPj4gICAgICAg
IPCfmqcg4pqh4pqh4pqhIGp2bSAtIGpjc3RyZXNzIHRlc3RzCj4+ICAgICAgICDwn5qnIOKaoeKa
oeKaoSBNZW1vcnkgZnVuY3Rpb246IGthc2xyCj4+ICAgICAgICDwn5qnIOKaoeKaoeKaoSBMVFA6
IG9wZW5wb3NpeCB0ZXN0IHN1aXRlCj4+ICAgICAgICDwn5qnIOKaoeKaoeKaoSBOZXR3b3JraW5n
IHZuaWM6IGlwdmxhbi9iYXNpYwo+PiAgICAgICAg8J+apyDimqHimqHimqEgaW90b3A6IHNhbml0
eQo+PiAgICAgICAg8J+apyDimqHimqHimqEgVXNleCAtIHZlcnNpb24gMS45LTI5Cj4+ICAgICAg
ICDwn5qnIOKaoeKaoeKaoSBzdG9yYWdlOiBkbS9jb21tb24KPj4gICAgIEhvc3QgMjoKPj4gICAg
ICAgIOKchSBCb290IHRlc3QKPj4gICAgICAgIOKchSBTdG9yYWdlIFNBTiBkZXZpY2Ugc3RyZXNz
IC0gbXB0M3NhcyBkcml2ZXIKPj4gICAgIEhvc3QgMzoKPj4gICAgICAgIOKchSBCb290IHRlc3QK
Pj4gICAgICAgIOKchSBTdG9yYWdlIFNBTiBkZXZpY2Ugc3RyZXNzIC0gbWVnYXJhaWRfc2FzCj4+
ICAgICBIb3N0IDQ6Cj4+ICAgICAgICDinIUgQm9vdCB0ZXN0Cj4+ICAgICAgICDinYwgeGZzdGVz
dHMgLSBleHQ0Cj4+ICAgICAgICDimqHimqHimqEgeGZzdGVzdHMgLSB4ZnMKPj4gICAgICAgIOKa
oeKaoeKaoSBzZWxpbnV4LXBvbGljeTogc2VyZ2UtdGVzdHN1aXRlCj4+ICAgICAgICDimqHimqHi
mqEgbHZtIHRoaW5wIHNhbml0eQo+PiAgICAgICAg4pqh4pqh4pqhIHN0b3JhZ2U6IHNvZnR3YXJl
IFJBSUQgdGVzdGluZwo+PiAgICAgICAg4pqh4pqh4pqhIHN0cmVzczogc3RyZXNzLW5nCj4+ICAg
ICAgICDwn5qnIOKaoeKaoeKaoSBJT01NVSBib290IHRlc3QKPj4gICAgICAgIPCfmqcg4pqh4pqh
4pqhIElQTUkgZHJpdmVyIHRlc3QKPj4gICAgICAgIPCfmqcg4pqh4pqh4pqhIElQTUl0b29sIGxv
b3Agc3RyZXNzIHRlc3QKPj4gICAgICAgIPCfmqcg4pqh4pqh4pqhIHBvd2VyLW1hbmFnZW1lbnQ6
IGNwdXBvd2VyL3Nhbml0eSB0ZXN0Cj4+ICAgICAgICDwn5qnIOKaoeKaoeKaoSBTdG9yYWdlIGJs
a3Rlc3RzCj4+ICAgVGVzdCBzb3VyY2VzOiBodHRwczovL2dpdGh1Yi5jb20vQ0tJLXByb2plY3Qv
dGVzdHMtYmVha2VyCj4+ICAgICDwn5KaIFB1bGwgcmVxdWVzdHMgYXJlIHdlbGNvbWUgZm9yIG5l
dyB0ZXN0cyBvciBpbXByb3ZlbWVudHMgdG8gZXhpc3RpbmcgdGVzdHMhCj4+IFdhaXZlZCB0ZXN0
cwo+PiAtLS0tLS0tLS0tLS0KPj4gSWYgdGhlIHRlc3QgcnVuIGluY2x1ZGVkIHdhaXZlZCB0ZXN0
cywgdGhleSBhcmUgbWFya2VkIHdpdGgg8J+apy4gU3VjaCB0ZXN0cyBhcmUKPj4gZXhlY3V0ZWQg
YnV0IHRoZWlyIHJlc3VsdHMgYXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQuIFRlc3RzIGFyZSB3
YWl2ZWQgd2hlbgo+PiB0aGVpciByZXN1bHRzIGFyZSBub3QgcmVsaWFibGUgZW5vdWdoLCBlLmcu
IHdoZW4gdGhleSdyZSBqdXN0IGludHJvZHVjZWQgb3IgYXJlCj4+IGJlaW5nIGZpeGVkLgo+PiBU
ZXN0aW5nIHRpbWVvdXQKPj4gLS0tLS0tLS0tLS0tLS0tCj4+IFdlIGFpbSB0byBwcm92aWRlIGEg
cmVwb3J0IHdpdGhpbiByZWFzb25hYmxlIHRpbWVmcmFtZS4gVGVzdHMgdGhhdCBoYXZlbid0Cj4+
IGZpbmlzaGVkIHJ1bm5pbmcgeWV0IGFyZSBtYXJrZWQgd2l0aCDij7EuCj4gCgoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
