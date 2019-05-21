Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2C72571F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 19:57:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A990F3EA5A3
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 19:57:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 967093EA53D
 for <ltp@lists.linux.it>; Tue, 21 May 2019 19:57:34 +0200 (CEST)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8E8AF10006C0
 for <ltp@lists.linux.it>; Tue, 21 May 2019 19:57:30 +0200 (CEST)
Received: by mail-lj1-x241.google.com with SMTP id 14so642368ljj.5
 for <ltp@lists.linux.it>; Tue, 21 May 2019 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13iR66s35EeUhXp2Ectoi0OYdgpCcLBjgrRmPgISBoM=;
 b=uH9I6b0JCQbUYvD1LQ/glpe/cwjIy5fEvVhCo7mSI3nnWN8qaC32ctzL3bx4y9FHx1
 8b6JffttjvceV7oO33hEAchiQ141RYZOda/yElKfLKngnwq7bfAIT8x1KuEn9d8sZAYm
 ArSJM9+nF6Zm+FJdKPJtCR4kBp/zvoi/e2Rqc+DZAlxoQLLHBSA18HY6yUjTMAWRUX38
 WyPhja20hFXrXImDxpdjqmJTjoSwPIR54QrpmJE3SYs488Csl26LxlYhI5g8PNBDAVuw
 RSQ6ZxhJJqT0VbQ1ZfvEeaXUdXasb0L1jbiXU11exgVIx0Lv+whO/t376N1UiGC9ID/i
 S4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13iR66s35EeUhXp2Ectoi0OYdgpCcLBjgrRmPgISBoM=;
 b=cR+ki1JROEu0X6HCHWEsKUryjmrBW1McUKAifuh4eYcvTZTtli6UF/qewMPcxMgVnB
 Er+JEya3w88B9l4mH+tApw5NbK3jZE9M6727Ar/WX/MBluqsgl9Zi07xrh00a+buttkF
 PLaIyLKVlvkBVwUyixRdGab+c46F7C4rU/imzx5TrxisrhWuxErMDWjGB4Z9WaMiqqVG
 GXqDQgjJSd8eOYfPAeErzQumVEwQwXVc32abaupL35hA16fXHn3J9dfCMuCgSNT8eips
 U3890CdsRcYLY4BHaF75pnPDEIZggayfwFskycOGhtPPTf7dRV3oUKGoZrHuu1vbs0OA
 rvMA==
X-Gm-Message-State: APjAAAUxwiBkOmRfPP9gNEQydFT05L2QLZcbVZR0p8xnMEwYbk07ldrY
 sTptItxTA8PxGSjxtItTZWXwqqtp9YvHDJN3GErQ+g==
X-Google-Smtp-Source: APXvYqxoVhtW6+H2OrjfsFNbhD7UYzdFtNxwmWLYrzO83Xt+JIlW+jv9qAzgJgpe0LduUYpYcryZKFWuLW7FD/A8aw8=
X-Received: by 2002:a2e:7411:: with SMTP id p17mr26016219ljc.24.1558461453024; 
 Tue, 21 May 2019 10:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190520115247.060821231@linuxfoundation.org>
 <20190520222342.wtsjx227c6qbkuua@xps.therub.org>
 <20190521085956.GC31445@kroah.com>
 <CA+G9fYvHmUimtwszwo=9fDQLn+MNh8Vq3UGPaPUdhH=dEKzqxg@mail.gmail.com>
 <20190521093849.GA9806@kroah.com>
 <CA+G9fYveeg_FMsL31aunJ2A9XLYk908Y1nSFw4kwkFk3h3uEiA@mail.gmail.com>
 <20190521162142.GA2591@mit.edu>
In-Reply-To: <20190521162142.GA2591@mit.edu>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 21 May 2019 23:27:21 +0530
Message-ID: <CA+G9fYunxonkqmkhz+zmZYuMTfyRMVBxn6PkTFfjd8tTT+bzHQ@mail.gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Shuah Khan <shuah@kernel.org>,
 patches@kernelci.org, 
 Ben Hutchings <ben.hutchings@codethink.co.uk>, lkft-triage@lists.linaro.org, 
 linux- stable <stable@vger.kernel.org>, linux-ext4@vger.kernel.org, 
 Arthur Marsh <arthur.marsh@internode.on.net>, 
 Richard Weinberger <richard.weinberger@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] ext4 regression (was Re: [PATCH 4.19 000/105]
	4.19.45-stable review)
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

T24gVHVlLCAyMSBNYXkgMjAxOSBhdCAyMTo1MiwgVGhlb2RvcmUgVHMnbyA8dHl0c29AbWl0LmVk
dT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAwMzo1ODoxNVBNICswNTMwLCBO
YXJlc2ggS2FtYm9qdSB3cm90ZToKPiA+ID4gVGVkLCBhbnkgaWRlYXMgaGVyZT8gIFNob3VsZCBJ
IGRyb3AgdGhpcyBmcm9tIHRoZSBzdGFibGUgdHJlZXMsIGFuZCB5b3UKPiA+ID4gcmV2ZXJ0IGl0
IGZyb20gTGludXMncz8gIE9yIHNvbWV0aGluZyBlbHNlPwo+Cj4gSXQncyBzYWZlIHRvIGRyb3Ag
dGhpcyBmcm9tIHRoZSBzdGFibGUgdHJlZXMgd2hpbGUgd2UgaW52ZXN0aWdhdGUuICBJdAo+IHdh
cyBhbHdheXMgYm9yZGVybGluZSBmb3Igc3RhYmxlIGFueXdheS4gIChTZWUgYmVsb3cpLgo+Cj4g
PiA+Cj4gPiA+IE5vdGUsIEkgZG8gYWxzbyBoYXZlIDE3MDQxN2M4YzdiYiAoImV4dDQ6IGZpeCBi
bG9jayB2YWxpZGl0eSBjaGVja3MgZm9yCj4gPiA+IGpvdXJuYWwgaW5vZGVzIHVzaW5nIGluZGly
ZWN0IGJsb2NrcyIpIGluIHRoZSB0cmVlcywgd2hpY2ggd2FzIHN1cHBvc2VkCj4gPiA+IHRvIGZp
eCB0aGUgcHJvYmxlbSB3aXRoIHRoaXMgcGF0Y2gsIGFtIEkgbWlzc2luZyBhbm90aGVyIG9uZSBh
cyB3ZWxsPwo+ID4KPiA+IEZZSSwKPiA+IEkgaGF2ZSBhcHBsaWVkIGZpeCBwYXRjaCAxNzA0MTdj
OGM3YmIgKCJleHQ0OiBmaXggYmxvY2sgdmFsaWRpdHkgY2hlY2tzIGZvcgo+ID4gIGpvdXJuYWwg
aW5vZGVzIHVzaW5nIGluZGlyZWN0IGJsb2NrcyIpIGJ1dCBkaWQgbm90IGZpeCB0aGlzIHByb2Js
ZW0uCj4KPiBIbW0uLi4gYXJlIHlvdSBfc3VyZV8/ICBUaGlzIGJ1ZyB3YXMgcmVwb3J0ZWQgdG8g
bWUgdmVyc3VzIHRoZQo+IG1haW5saW5lLCBhbmQgdGhlIHBlcnNvbiB3aG8gcmVwb3J0ZWQgaXQg
Y29uZmlybWVkIHRoYXQgaXQgZGlkIGZpeCB0aGUKPiBwcm9ibGVtLCBoZSB3YXMgc2VlaW5nLCBh
bmQgdGhlIHN5bXB0b21zIGFyZSBpZGVudGljYWwgdG8geW91cnMuICBDYW4KPiB5b3UgZG91Ymxl
IGNoZWNrLCBwbGVhc2U/ICBJIGNhbid0IHJlcHJvZHVjZSBpdCBlaXRoZXIgd2l0aCB0aGF0IHBh
dGNoIGFwcGxpZWQuCgpUaGlzIGJ1ZyBpcyBzcGVjaWZpYyB0byB4ODZfNjQgYW5kIGkzODYuCgpT
dGVwcyB0byByZXByb2R1Y2UgaXMsCnJ1bm5pbmcgTFRQIHRocmVlIHRlc3QgY2FzZXMgaW4gc2Vx
dWVuY2Ugb24geDg2IGRldmljZS4KIyBjZCBsdHAvcnVudGVzdAojIGNhdCBzeXNjYWxscyAoIG9u
bHkgdGhyZWUgdGVzdCBjYXNlKQpvcGVuMTIgb3BlbjEyCm1hZHZpc2UwNiBtYWR2aXNlMDYKcG9s
bDAyIHBvbGwwMgojCgphcyBEYW4gcmVmZXJyaW5nIHRvLAoKTFRQIGlzIHJ1biB1c2luZyAnL29w
dC9sdHAvcnVubHRwIC1kIC9zY3JhdGNoIC1mIHN5c2NhbGxzJywgd2hlcmUgdGhlCnN5c2NhbGxz
IGZpbGUgaGFzIGJlZW4gcmVwbGFjZWQgd2l0aCB0aHJlZSB0ZXN0IGNhc2UgbmFtZXMsIGFuZAov
c2NyYXRjaCBpcyBhbiBleHQ0IFNBVEEgZHJpdmUuIC9zY3JhdGNoIGlzIGNyZWF0ZWQgdXNpbmcg
J21rZnMgLXQgZXh0NAovZGV2L2Rpc2svYnktaWQvYXRhLVRPU0hJQkFfTUcwM0FDQTEwMF8zN085
S0dLV0YnIGFuZCBtb3VudGVkIHRvCi9zY3JhdGNoLgoKUGxlYXNlIGZpbmQgZnVsbCB0ZXN0IGxv
ZywKaHR0cHM6Ly9sa2Z0LnZhbGlkYXRpb24ubGluYXJvLm9yZy9zY2hlZHVsZXIvam9iLzczODY2
MSNMMTM1NgoKQW5kIHlvdSBub3RpY2UgZG1lc2cgbG9nLApbICAgNTMuODk3MDAxXSBFWFQ0LWZz
IGVycm9yIChkZXZpY2Ugc2RhKTogZXh0NF9maW5kX2V4dGVudDo5MDk6IGlub2RlCiM4OiBjb21t
IGpiZDIvc2RhLTg6IHBibGsgMTIxNjY3NTgzIGJhZCBoZWFkZXIvZXh0ZW50OiBpbnZhbGlkIGV4
dGVudAplbnRyaWVzIC0gbWFnaWMgZjMwYSwgZW50cmllcyA4LCBtYXggMzQwKDM0MCksIGRlcHRo
IDAoMCkKWyAgIDUzLjkzMTQzMF0gamJkMl9qb3VybmFsX2JtYXA6IGpvdXJuYWwgYmxvY2sgbm90
IGZvdW5kIGF0IG9mZnNldCA0OSBvbiBzZGEtOApbICAgNTMuOTM4NDgwXSBBYm9ydGluZyBqb3Vy
bmFsIG9uIGRldmljZSBzZGEtOC4KWyAgIDU1LjQzMTM4Ml0gRVhUNC1mcyBlcnJvciAoZGV2aWNl
IHNkYSk6CmV4dDRfam91cm5hbF9jaGVja19zdGFydDo2MTogRGV0ZWN0ZWQgYWJvcnRlZCBqb3Vy
bmFsClsgICA1NS40Mzk5NDddIEVYVDQtZnMgKHNkYSk6IFJlbW91bnRpbmcgZmlsZXN5c3RlbSBy
ZWFkLW9ubHkKCi0gTmFyZXNoCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMu
bGludXguaXQvbGlzdGluZm8vbHRwCg==
