Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381D187759
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 02:13:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 721293C56BD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 02:13:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0C3943C5689
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 02:13:19 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9496E200B82
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 02:13:18 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id m15so10746178pgv.12
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 18:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Z9QRRar0/vp/4tqIvl2sncMcdXC6TEW/eu3JGYJ26xI=;
 b=afq73QbbybY4uGHdfOGZIAoYCjtTOZumIcOy0A4sYVy4DYR0Eln2iPeKA7LMpYZbRQ
 zChxd2f3/d5dD79UaJZFESbCe1rPmhweOSShlev4eOUHVF02Jci7I8a74K2GgFbrrCjt
 6hnncMb0DEy9OxegXd42yTPAkaZEZijoUC5qv9hFisgCkzWY3Q3Y8SI0AJ1wO8lCMZRA
 hqljBLm3+xKBgBc1QoHIPOulVFOQU9YT3nJIGLsvdCv8FTtsajCkX1tTwjt68sR/usDS
 Z84mA6gggxmNv2bzWA3ZfspTIkEVA+wk6hJRJ19jM+JGyWCJ625flSuAsdJmV+TeVlqX
 PtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Z9QRRar0/vp/4tqIvl2sncMcdXC6TEW/eu3JGYJ26xI=;
 b=MF7IYJWxO0N6EXFxRX3nhVxDEC4ag6CphSgAkYnmKajEAQNJJU/EmiQcHBivW7OdZN
 uLSyxCql/leT3hc9O0u/omYPRiGfUhAtYEtf24kL/VHKKhkR84gd1mM7+ocOA6hITfIq
 AT/utlgQQJH/8Uhb8B18mzJYMEg3H6APJLNBAYN97K/U8gp1WxA0ceLeJkA2sqkZNns8
 cofiMh06hL12EAJU+WXPh1Bp1HULax5MdH5jfHdRsNn7daQQriW9VguBC1xrCV6iS7ni
 UTQhSDPfww+znkYkR0OMPghMLpop4RIbBR9khvd5qFmwUuMRYw1Xdg/1rFqks9MYtFL+
 KleQ==
X-Gm-Message-State: ANhLgQ0cy743dgK5D2qvWRCscjDD9kWHsk/pxZIQj4F6T0Zhch40eGIN
 P6m4mduIRQBpdY2KM+J+DfI=
X-Google-Smtp-Source: ADFU+vt5c4lUTMQYCluZlF0V7sPIJQc4+9hYpGQnG4M4JUCFYL53TzHeJcgumi/aHgD4GA5K3IuV+Q==
X-Received: by 2002:a62:a116:: with SMTP id b22mr2592133pff.122.1584407596875; 
 Mon, 16 Mar 2020 18:13:16 -0700 (PDT)
Received: from [192.168.20.26] (c-73-19-52-228.hsd1.wa.comcast.net.
 [73.19.52.228])
 by smtp.gmail.com with ESMTPSA id r8sm840285pjo.22.2020.03.16.18.13.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Mar 2020 18:13:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
From: Enji Cooper <yaneurabeya@gmail.com>
In-Reply-To: <7017e8bc-616b-0958-b82e-852604c06a3b@cn.fujitsu.com>
Date: Mon, 16 Mar 2020 18:13:14 -0700
Message-Id: <F8D00AA0-47E2-4636-9A07-77B474C47003@gmail.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
 <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
 <7017e8bc-616b-0958-b82e-852604c06a3b@cn.fujitsu.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pthread_cond_init/s-c.c: Add the lose ifndef line
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
Cc: Zou Wei <zou_wei@huawei.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZywKCUnigJlsbCBoYXZlIHRvIGxvb2sgYmFjaywgYnV0IHRoaXMgbWlnaHQgaGF2ZSBi
ZWVuIHRoZSBvcmlnaW5hbCBzZXQgb2YgaXRlbXMgd2hpY2ggbmV2ZXIgY29tcGlsZWQvYnVpbHQg
Y2xlYW5seS4KCUkgdGhpbmsgaXTigJlzIHRpbWUgdG8gZ28gYmFjayB0byBhIG1vcmUgc2FuZSBn
bWFrZS1iYXNlZCBidWlsZCBmcmFtZXdvcmsuIE15IGdvYWwgaW4gbWFraW5nIHRoaW5ncyB3b3Jr
IHdpdGggUE9TSVggbWFrZSB3YXMgbm9ibGUgZm9yIHRoZSB0aW1lIGJ1dCBpdCBzZWVtcyBpbmNy
ZWRpYmx5IHVubmVjZXNzYXJ5IG5vdyBhbmQgSSB0aGluayBpdOKAmXMgb3ZlcmNvbXBsaWNhdGlu
ZyB0aGluZ3MuClRoYW5rcyEKLUVuamkKCj4gT24gTWFyIDE2LCAyMDIwLCBhdCAxMjo1MyBBTSwg
WWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4gd3JvdGU6Cj4gCj4gSGkgQ3ly
aWwKPiAKPiBPbiBteSBlbnZpcm9ubWVudCwgd2hlbiBJIHRlc3Qgb3BlbnBvc2l4LCB0aGlzIGNh
c2UgbWlzc2VkIHJ1biBhbmQgY29tcGxpZSBiZWNhdXNlIGxvY2F0ZS10ZXN0IGhhcyBmaWx0ZXIg
cnVsZXMgY2FsbGVkIGJ5IG9wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvZ2VuZXJhdGUtbWFr
ZWZpbGVzLnNoLiAgZmlsdGVyIHJ1bGVzIGFzIGJlbG93Ogo+IAo+IHJ1bm5hYmxlKQo+ICAgICAg
ICBmaW5kICIkV0hFUkUvY29uZm9ybWFuY2UiICIkV0hFUkUvc3RyZXNzIiAtdHlwZSBmIC1uYW1l
ICcqWzAtOV0uYycgLW8gLW5hbWUgJ1swLTldKi1bMC05XSouc2gnIHwgZ3JlcCAtdiBidWlsZG9u
bHkgfCBncmVwIC12ICdeLi90b29scycKPiAgICAgICAgZmluZCAiJFdIRVJFL2Z1bmN0aW9uYWwi
IC10eXBlIGYgLW5hbWUgJyouYycKPiAKPiBJIGhhdmUgYSBxdWVzdGlvbiB3aHkgd2UgbGVhdmUg
aXQgaGVyZSBpZiB0aGV5IGFyZSBubyBtZWFuaW5nZnVsLiBJZgo+IGl0IHdhcyBtZWFuaW5nZnVs
LCB3aHkgd2UgZmlsdGVyIHRoaXMgY2FzZT8gSSBzZWUgdGhlIGhpc3RvcnksIGJ1dCBmb3VuZCBu
byB0aGluZy4KPiAKPiBARW5qaSwgeW91IG9mdGVuIGNoYW5nZSBvcGVucG9zaXggY29kZSwgY2Fu
IHlvdSBnaXZlIG1lIHNvbWUgYWR2aXNlPwo+IAo+IEJlc3QgUmVnYXJkcwo+IFlhbmcgWHUKPiAK
Pj4gSGkgWm91Cj4+IEl0IHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAzMTBjOWViNmU2KCJSZW1v
dmUgZXhwbGljaXQgI2RlZmluZSdzIGZvciBgX1BPU0lYX0NfU09VUkNFYCBhbmQgYF9YT1BFTl9T
T1VSQ0VgIikuCj4+IElNTywgd2UgY2FuIHJlbW92ZSB0aGlzIFdJVEhPVVRfWE9QRU4gbWFjcm8g
ZGlyZWN0bHkgYmVjYXVzZSB3ZSBoYXZlIHNldHRlZCAtRF9QT1NJWF9DX1NPVVJDRT0yMDA4MDlM
IC1EX1hPUEVOX1NPVVJDRT03MDAgaW4gbHRwL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0
ZS9DRkxBR1MuCj4+IEJlc3QgUmVnYXJkcwo+PiBZYW5nIFh1Cj4+PiBwdGhyZWFkX2NvbmRfaW5p
dC9zLWMuYyB0ZXN0Y2FzZSBsb3NlIGEgI2lmbmRlZiBsaW5lLCBmaXggaXQKPj4+IAo+Pj4gUmVw
b3J0ZWQtYnk6IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6
IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4gIHRlc3RjYXNlcy9vcGVu
X3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMuYyB8
IDEgKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+IAo+Pj4gZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhy
ZWFkX2NvbmRfaW5pdC9zLWMuYyBiL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJl
c3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMuYyAKPj4+IGluZGV4IDZhNWM3MGEuLjhk
MTg0ODQgMTAwNjQ0Cj4+PiAtLS0gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc3Ry
ZXNzL3RocmVhZHMvcHRocmVhZF9jb25kX2luaXQvcy1jLmMKPj4+ICsrKyBiL3Rlc3RjYXNlcy9v
cGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMu
Ywo+Pj4gQEAgLTgwLDYgKzgwLDcgQEAKPj4+ICAgLyoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqICAgIFRlc3QgY2FzZSAgICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqLwo+Pj4gIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8gCj4+
PiArI2lmbmRlZiBXSVRIT1VUX1hPUEVOCj4+PiAgIHR5cGVkZWYgc3RydWN0IF90ZXN0c3RydWN0
IHsKPj4+ICAgICAgIHB0aHJlYWRfY29uZF90IGNuZFsxMCAqIFNDQUxBQklMSVRZX0ZBQ1RPUl07
Cj4+PiAgICAgICBwdGhyZWFkX2NvbmRhdHRyX3QgY2FbNF07Cj4+PiAtLSAKPj4+IDIuNi4yCj4+
PiAKPj4+IAo+IAo+IAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
