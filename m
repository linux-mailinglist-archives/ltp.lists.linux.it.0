Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E92C600
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 13:59:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4138D294AC4
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 13:59:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 45D8C3EA1EF
 for <ltp@lists.linux.it>; Tue, 28 May 2019 13:59:14 +0200 (CEST)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3CC5B600659
 for <ltp@lists.linux.it>; Tue, 28 May 2019 13:59:14 +0200 (CEST)
Received: by mail-yb1-xb43.google.com with SMTP id x7so7731725ybg.5
 for <ltp@lists.linux.it>; Tue, 28 May 2019 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+PlVd2PviLddCnYe4o0KtbsxS1wM5fJ7i1zo69iDaMM=;
 b=i0FfPw8ONheBthzG2iZm5fUrIj8f8gKQx4VEnvnnse8fy9u6JgiqyPg0RL7edPwAJs
 /blOhb1QdxolgfHsAgzqPZA5m+1mwrRzb9s3NQGdrDZvDJGr0q04/KvJxFQV5fN+5SUr
 0nUaHEbBAz4NrrBAUtclMrYT3zpsrDQdu6eUF3JTorQOk2c4KQvH+zSBT2bGNy884TFC
 //G6lZmAM2NF4mI6Hj5+VZAi4FtiS2+09amn5xkJJ5u3Fj3lbuIzCI2A8dfZlH1D16QK
 Csvbea2yaKG2Jfunx4JUcVBm548r99+A+He1z3Udhp70IVaQcFjQkBquqoZd6/IPm5AY
 v91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+PlVd2PviLddCnYe4o0KtbsxS1wM5fJ7i1zo69iDaMM=;
 b=KunbfM3zjifp9OFhcBhQ0jWa6mYMDGlxHW9yis81igt8OlHmJ5mwyclPpRJUqK8nEm
 vbo0URLyvt5Exl/7KcSrs5Jh0nRUJsqUpSnUbHwX/F5r9VjPXCrsThiawWHH420R/4i7
 j2xI/pQhXhqmUo76MnclLtHDKAejRmpFdEHkoSa7pXd3sMA8bgldSiD7CvyXsSi6cel9
 Yy4DGjtAKIjRFfxmTX6o4Z6q8W7BivpyF+yf6Ss8BbYAYTY/mdIyrEwIFD7Crw5mmSEy
 nwUrg24GpKe3TEODncMwgQfuGb+16hYjhM8yD0x8omwXguGGuIBzte9BbTBDDIc6Gj0s
 r4dA==
X-Gm-Message-State: APjAAAX+dgf/GNjm0KvZSoRWaIhvQHnIcwDZ6nDFszgA5lCc/l7aIJxP
 FVD7RNtIcVK/YxFx7P+ZuDGsOSpmqCmpjgOWI7E=
X-Google-Smtp-Source: APXvYqzYMpf4tS5QfAqWjAje6EIQnkDto98rlYM78DAd109JUMSlNtVGTHsygc6Miw3nU+vdgaHHDsALMDKMmMKWjP4=
X-Received: by 2002:a25:cb0c:: with SMTP id b12mr34348227ybg.144.1559044753081; 
 Tue, 28 May 2019 04:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190523135518.GF30616@rei.lan>
 <20190528043929.19671-1-xzhou@redhat.com>
 <20190528043929.19671-2-xzhou@redhat.com>
 <CAOQ4uxj_0F3pWGCLA4Fxcq54TVViid_8G3fpJw89Un8UfCo87g@mail.gmail.com>
 <20190528095622.gi5islpc7zlmpc2n@XZHOUW.usersys.redhat.com>
In-Reply-To: <20190528095622.gi5islpc7zlmpc2n@XZHOUW.usersys.redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 28 May 2019 14:59:01 +0300
Message-ID: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v5 2/4] swapon/libswapon: add helper
	is_swap_supported
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMTI6NTYgUE0gTXVycGh5IFpob3UgPHh6aG91QHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDg6NTY6MDZBTSArMDMw
MCwgQW1pciBHb2xkc3RlaW4gd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCA3OjQw
IEFNIE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVG8g
Y2hlY2sgaWYgdGhlIGZpbGVzeXN0ZW0gd2UgYXJlIHRlc3Rpbmcgb24gc3VwcG9ydHMgc3dhcG9u
L3N3YXBvZmYKPiA+ID4gb3BlcmF0aW9ucy4gS2VlcCBORlMgYW5kIFRNUEZTIG9uIHRoZSB3aGl0
ZSBsaXN0LiBEb24ndCByZXBvcnQgZmFpbAo+ID4gPiBpZiBCVFJGUyBmYWlscyB3aXRoIEVJTlZB
TC4KPiA+Cj4gPiBDaGFuZ2VzIGxvb2sgdmVyeSBnb29kLCBidXQgSSBkb24ndCB0aGluayB5b3Ug
bmVlZCB0aGUgd2hpdGVsaXN0IGFueW1vcmUuLi4KPiA+Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIHRlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jIHwgNTYgKysrKysrKysrKysr
KysrKysrKysKPiA+ID4gIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBv
bi5oIHwgIDYgKysrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKPiA+
ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xp
YnN3YXBvbi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vbGlic3dhcG9uLmMK
PiA+ID4gaW5kZXggY2Y2YTk4ODkxLi5lMDJmZGQ0YWQgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jCj4gPiA+ICsrKyBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL2xpYnN3YXBvbi5jCj4gPiA+IEBAIC0xOSw2ICsx
OSw4IEBACj4gPiA+ICAgKgo+ID4gPiAgICovCj4gPiA+Cj4gPiA+ICsjaW5jbHVkZSA8ZXJybm8u
aD4KPiA+ID4gKyNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gPiA+ICAjaW5jbHVkZSAidGVz
dC5oIgo+ID4gPiAgI2luY2x1ZGUgImxpYnN3YXBvbi5oIgo+ID4gPgo+ID4gPiBAQCAtNDcsMyAr
NDksNTcgQEAgdm9pZCBtYWtlX3N3YXBmaWxlKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25zdCBj
aGFyICpzd2FwZmlsZSkKPiA+ID4KPiA+ID4gICAgICAgICB0c3RfcnVuX2NtZChjbGVhbnVwLCBh
cmd2LCAiL2Rldi9udWxsIiwgIi9kZXYvbnVsbCIsIDApOwo+ID4gPiAgfQo+ID4gPiArCj4gPiA+
ICsvKgo+ID4gPiArICogQ2hlY2sgc3dhcG9uL3N3YXBvZmYgc3VwcG9ydCBzdGF0dXMgb2YgZmls
ZXN5c3RlbXMgb3IgZmlsZXMKPiA+ID4gKyAqIHdlIGFyZSB0ZXN0aW5nIG9uLgo+ID4gPiArICov
Cj4gPiA+ICt2b2lkIGlzX3N3YXBfc3VwcG9ydGVkKHZvaWQgKGNsZWFudXApKHZvaWQpLCBjb25z
dCBjaGFyICpvcHMsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqZmlsZW5hbWUpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgaW50IGZpYm1hcCA9IHRzdF9m
aWJtYXAoZmlsZW5hbWUpOwo+ID4gPiArICAgICAgIGxvbmcgZnNfdHlwZSA9IHRzdF9mc190eXBl
KGNsZWFudXAsIGZpbGVuYW1lKTsKPiA+ID4gKyAgICAgICBjb25zdCBjaGFyICpmc3R5cGUgPSB0
c3RfZnNfdHlwZV9uYW1lKGZzX3R5cGUpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgLyogd2hpdGVs
aXN0IGxlZ2FjeSBmcyAqLwo+ID4gPiArICAgICAgIHN3aXRjaCAoZnNfdHlwZSkgewo+ID4gPiAr
ICAgICAgIGNhc2UgVFNUX05GU19NQUdJQzoKPiA+ID4gKyAgICAgICBjYXNlIFRTVF9UTVBGU19N
QUdJQzoKPiA+ID4gKyAgICAgICAgICAgICAgIHRzdF9icmttKFRDT05GLCBjbGVhbnVwLAo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgIkNhbm5vdCBkbyAlcyBvbiBhIGZpbGUgb24gJXMg
ZmlsZXN5c3RlbSIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBvcHMsIGZzdHlwZSk7
Cj4gPiA+ICsgICAgICAgYnJlYWs7Cj4gPiA+ICsgICAgICAgfQo+ID4KPiA+IElmIHlvdSByZW1v
dmUgdGhpcyB3aGl0ZWxpc3QsIHRoZW4gTkZTLHRtcGZzIHdpbGwgcmVhY2ggdGhlIGZpZW1hcCAh
PSAwIGNhc2UKPiA+IGFuZCByZXN1bHQgaW4gdHN0X2Jya20oVENPTkYgYW55d2F5Lgo+ID4KPiA+
ID4gKwo+ID4gPiArICAgICAgIG1ha2Vfc3dhcGZpbGUoTlVMTCwgZmlsZW5hbWUpOwo+ID4gPiAr
Cj4gPiA+ICsgICAgICAgVEVTVChsdHBfc3lzY2FsbChfX05SX3N3YXBvbiwgZmlsZW5hbWUsIDAp
KTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGlmIChURVNUX1JFVFVSTiA9PSAtMSkgewo+ID4gPiAr
ICAgICAgICAgICAgICAgaWYgKGZzX3R5cGUgPT0gVFNUX0JUUkZTX01BR0lDICYmIGVycm5vID09
IEVJTlZBTCkgewo+ID4KPiA+IElmIHlvdSByZXBsYWNlIChmc190eXBlID09IFRTVF9CVFJGU19N
QUdJQykgd2l0aCAoZmlibWFwICE9IDApCj4gPiB0aGVuIE5GUyBzd2FwZmlsZSBzdXBwb3J0IGNv
dWxkIGJlIHRlc3RlZCBhcyB3ZWxsIGFuZCB5b3UgZG8gbm90Cj4gPiBzcGVjaWFsIGNhc2UgYW55
IGZpbGVzeXN0ZW0uCj4KPiBUaGVyZSBpcyBhIHN1cnByaXNlIHRoYXQgb24gb2xkIGtlcm5lbHMs
IDIuNi4zMiBiYXNlZCwgdGhpcyBjaGFuZ2UKPiB3b3VsZCBUQlJPSyB3aGl0ZWxpc3RlZCBORlMg
VENPTkYgd2hpbGUgbWtzd2FwIHN3YXBmaWxlcy4KPgo+IFRCUk9LIG9uIG1rc3dhcCBmYWlsdXJl
IHNlZW1zIHRoZSByaWdodCB0aGluZyB0byBkbywgYnV0IHRoZSB3aGl0ZWxpc3QKPiBoZXJlIGlu
dGVuZGVkIHRvIGZpeCB0aGlzIGZhbHNlIGFsYXJtLgo+Cj4gSSByZW1lbWJlciBMaSBzdWdnZXN0
ZWQgdGhhdCB1bi13aGl0ZWxpc3QgTkZTIHdvdWxkIGJyZWFrIG9sZCBkaXN0cm9zLgo+IFRNUEZT
IGlzIGZpbmUuCj4KPiBNYXliZSB3ZSBzaG91bGQgc2FmZWx5IGNoZWNrIGlmIG1rc3dhcCBpcyBk
b2FibGUgYmVmb3JlIGNoZWNraW5nIHN3YXBvbj8KPiBta3N3YXAgZmFpbCwgZmlibWFwIGZhaWwg
LS0+IHRzdF9icmsgVENPTkYKPiBta3N3YXAgZmFpbCwgZmlibWFwIHBhc3MgLS0+IHRzdF9icmsg
VEZBSUwKPgoKTWFrZXMgc2Vuc2UgdG8gbWUuCgpUaGFua3MsCkFtaXIuCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
