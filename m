Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB9225F8
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 06:39:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48B913EA58E
	for <lists+linux-ltp@lfdr.de>; Sun, 19 May 2019 06:39:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 526463EA202
 for <ltp@lists.linux.it>; Sun, 19 May 2019 06:39:44 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 035852009BF
 for <ltp@lists.linux.it>; Sun, 19 May 2019 06:39:35 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id q17so5583333pfq.8
 for <ltp@lists.linux.it>; Sat, 18 May 2019 21:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FBG0DbjEBnCciuZIC72hNMi5H56wSLXUWeGIl+cnDm0=;
 b=tSAw8cRIrNRHr66oSIutqbVEiomxF+X9nHjat9n3nfwUP+Hon6GPyTs92b97cYBPtk
 XOpefmmiIEbyCUvAMT9qG4WqPVPvij+w+Kg/ujaLsUWUOR+uwGOSPrRsFHzlNhDribDj
 uHd2y2lk8jysx9AIHdAvTOMnSQCYcb6+BqtpXrF14VMglVaOUs9Vovaj6UTmeOtKl+hD
 qer5SrzJVWxDMY+Oj63I0LqPg4ChLkOUs/mrN0dYAVpbmM0rOLYudv/I/BU8fdaG7G99
 5riX12iX67wrrPh+p/ymeHw4+i1dwFpgG6KN5wi9B63Q4dDz88U/QehEbQ83DN9b9o9a
 vNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FBG0DbjEBnCciuZIC72hNMi5H56wSLXUWeGIl+cnDm0=;
 b=QqOTQS+7pQWUUEixffskX3IRLJ61FJ3AH11o+famk1TVg2dM0ajuvuhnbJpODumC8X
 5uOYcAT9sE7c5atKemwzXLYG+ZjOZ3EJumKQEy5Vd8/rvKKqQcmWZWXbAcWxSaK4OYsu
 jtfZsXZTOibnjUTSfbbv1swTQKuUmnw+XgCxQ4ET2UcWHjcSOabXusWoAt/m5yGYLWoM
 AIzEhyGb9OAjVMxrusT0RZi5PY5gkL/u6Dwv1pVPEIh0GxTX2fIB6uXAIhVmc1H5C0fd
 Bt5YtqK/0nMrO0uJPZ92X/Tp9Ajr6m/mOUFjvAEMxA3XA6X45jmFWmp5COJoOulRJwOT
 655w==
X-Gm-Message-State: APjAAAW/4BBYrzV7w4nQR13Z3GYYEkb/AltyHWAsNJLW4p4bTGA8guNj
 QnbV4SdB8igTmJ8IvkLhq7Px9/OvjA==
X-Google-Smtp-Source: APXvYqygDqtBIC6Td7LCyaVwgPvwTnR8O6uSd4FxAidUSrw2ZUoyYf+g5j8KZSt7CGlqObpazjK/vg==
X-Received: by 2002:a63:1460:: with SMTP id 32mr68193307pgu.319.1558240774333; 
 Sat, 18 May 2019 21:39:34 -0700 (PDT)
Received: from poseidon.Home (n114-74-156-190.sbr2.nsw.optusnet.com.au.
 [114.74.156.190])
 by smtp.gmail.com with ESMTPSA id h13sm13373096pgk.55.2019.05.18.21.39.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 May 2019 21:39:33 -0700 (PDT)
Date: Sun, 19 May 2019 14:39:23 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190519043919.GA8583@poseidon.Home>
References: <cover.1555763787.git.mbobrowski@mbobrowski.org>
 <6639dd7a9ff9929ce79f4f353f3e1db075594ea2.1555763787.git.mbobrowski@mbobrowski.org>
 <20190426152748.GA31769@rei.lan>
 <20190427045341.GA3894@lithium.mbobrowski.org>
 <CAOQ4uxh7Ea02UyWeZKP5jJxhHkiTNpChH_H3=bFLNnZG4SU7-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxh7Ea02UyWeZKP5jJxhHkiTNpChH_H3=bFLNnZG4SU7-g@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/3] syscalls/fanotify13: new test to verify
 FAN_REPORT_FID functionality
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDU6NTA6MDNQTSArMDMwMCwgQW1pciBHb2xkc3RlaW4g
d3JvdGU6Cj4gPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAwNToyNzo0OFBNICswMjAwLCBDeXJp
bCBIcnViaXMgd3JvdGU6Cj4gPiA+IEhpIQo+ID4gPiBJJ3ZlIHRyaWVkIHRoZXNlIHRlc3RzIG9u
IGJ1aWxkc2VydmljZSB0byBjaGVjayB0aGF0IHRoZXJlIGFyZSBubwo+ID4gPiBwcm9ibGVtcyBv
biBzbGlnaHRseSBvbGRlciBkaXN0cmlidXRpb25zIGFuZCBmb3VuZCB0d28uCj4gPiA+Cj4gPiA+
IFRoZSBmaXJzdCBvbmUgaXMgdGhhdCB3ZSBkbyBkZWZpbmUgZmFsbGJhY2sgZGVmaW5pdGlvbnMg
aW4gZmFub3RpZnkuaAo+ID4gPiBidXQgdGhlbiBpZmRlZiB0aGUgd2hvbGUgdGVzdCBjb2RlIGlu
ICNpZiBkZWZpbmVkKEhBVkVfU1lTX0ZBTk9USUZZX0gpCj4gPiA+IHNvIHRoYXQgaXQncyBlZmVj
dGl2ZWx5IGRpc2FibGVkIG9uIG9sZGVyIGRpc3Ryb3MgZXZlbiB3aXRoIGZhbGxiYWNrCj4gPiA+
IGRlZmluaXRpb25zIGluIHBsYWNlLiBBbHNvIGl0J3MgVFNUX1RFU1RfVENPTkYoKSBidXQgdGhh
dCBpcyBqdXN0IGVhc3kKPiA+ID4gdG8gZml4IHR5cG8uIEkgZ3Vlc3MgdGhhdCB3ZSBjYW4gcmVt
b3ZlIHRoZSBpZmRlZiBhbmQgc3lzL2Zhbm90aWZ5LmgKPiA+ID4gaW5jbHVkZSBmcm9tIHRoZSB0
ZXN0IHNvdXJjZXMgc2luY2Ugd2UgY29uZGl0aW9uYWxseSBpbmNsdWRlIHRoZQo+ID4gPiBzeXMv
ZmFub3RpZnkuaCBpbiB0aGUgbG9jYWwgZmFub3RpZnkuaCBhbHJlYWR5Lgo+ID4KPiA+IE9LLiBJ
biB0aGF0IGNhc2UgSSBjYW4gd3JpdGUgYSBwYXRjaCB0aGF0IGlzIHRvIGJlIGFwcGxpZWQgcHJp
b3IgdG8gdGhpcyBzZXJpZXMKPiA+IHdoaWNoIGVzc2VudGlhbGx5IGp1c3QgcmVtb3ZlcyB0aGlz
IHNwZWNpZmljIHByZXByb2Nlc3NvciBjb25kaXRpb25hbCBkaXJlY3RpdmUKPiA+IGZyb20gYWxs
IHRoZSBzb3VyY2UgZmlsZXMuIFdvdWxkIHlvdSBsaWtlIG1lIHRvIGRvIHRoaXM/Cj4gCj4gSWYg
SSB1bmRlcnN0YW5kIHRoZSBjb25jZXJuIGNvcnJlY3RseSwgaXQgaXMgbm90IHJlYWxseSBpbXBv
cnRhbnQKPiB0byBhZGRyZXNzIG5vdyBmb3IgdGhlc2UgbmV3IHRlc3RzIHRoYXQgY2hlY2sgZnVu
Y3Rpb25hbGl0eSBvbmx5IGF2YWlsYWJsZQo+IHNpbmNlIGtlcm5lbCB2NS4xLiBJdCBjb3VsZCBi
ZSBhZGRyZXNzZWQgYnkgZm9sbG93dXAgd29yay4KCk9LLCBubyBwcm9ibGVtLCB0aGlzIGlzIGZp
bmUgd2l0aCBtZS4KIAo+ID4gPiBUaGUgc2Vjb25kIG9uZSBpcyB0aGF0IHdlIGZhaWwgdG8gY29t
cGlsZSBvbiBvbGRlciBkaXN0cmlidXRpb25zIGJlY2F1c2UKPiA+ID4gb2YgbWlzc2luZyBuYW1l
X3RvX2hhbmRsZV9hdCgpIHNvIHdlIG5lZWQgY29uZmlndXJlIGNoZWNrIGZvciB0aGF0Cj4gPiA+
IHN5c2NhbGwgYW5kIGZhbGxiYWNrIGRlZmluaXRpb24gaW4gbGFwaS8gaGVhZGVyLCBvciBhdCBs
ZWFzdCBjb25maWd1cmUKPiA+ID4gY2hlY2sgYW5kIGlmZGVmIGluIHRoZSBmYW5vdGlmeV9nZXRf
ZmlkKCkgZnVuY3Rpb24uIFdoaWNoIHNob3VsZCBiZSBhcwo+ID4gPiBlYXN5IGFzIGFkZGluZyBh
IG5hbWVfdG9faGFuZGxlX2F0IGxpbmUgdG8gQUNfQ0hFQ0tfRlVOQ1MoKSBpbiB0aGUKPiA+ID4g
Y29uZmlndXJlLmFjIGFuZCB1c2luZyB0aGUgbWFjcm8gZnJvbSBjb25maWcuaC4KPiA+Cj4gPiBT
dXJlLiBJJ3ZlIGdvbmUgYWhlYWQgYW4gdXBkYXRlZCBpdCB0byBhY2NvbW1vZGF0ZSBmb3IgdGhp
cy4gUHJpb3IgdG8KPiA+IHN1Ym1pdHRpbmcgdGhyb3VnaCBhbm90aGVyIHBhdGNoZXMgc2VyaWVz
LCBjaGFuZ2VzIGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL21hdHRo
ZXdib2Jyb3dza2kvbHRwL2NvbW1pdC81NDI2NGRiMGU1NzRkMmY5MGU3MTZhNTEwZmNiMWRhMTFl
ZTE3NGRjLgo+ID4KPiA+IEkgdGhpbmsgd2UgY2FuIGRvIGJldHRlciBhbmQgYWxzbyBwcm92aWRl
IGEgZmFsbGJhY2sgZGVmaW5pdGlvbiB0aG91Z2gsCj4gPiB0aG91Z2h0cz8gRG9uJ3QgYmVsaWV2
ZSB0aGF0IGl0IHdvdWxkIHRha2UgbXVjaCBlZmZvcnQuCj4gCj4gTm8gcmVhc29uIHRvIGRvIHRo
YXQuIFRob3NlIHRlc3RzIHdpbGwgb25seSBiZSBzdXBwb3J0ZWQgb24ga2VybmVsID49IHY1LjEK
PiBvbGQgZGlzdHJvcyBhcmUgbGVzcyBpbnRlcmVzdGluZyBmb3IgdGhlc2UgdGVzdHMuCj4gCj4g
UGxlYXNlIHBvc3QgdGhlIHBhdGNoZXMgZm9yIGZhbm90aWZ5X2RpcmVudF8zIGJyYW5jaC4KCk9L
LiBJJ3ZlIHJlYmFzZWQgZmFub3RpZnlfZGlyZW50XzMgb2YgdXBzdHJlYW0vbWFzdGVyIGFuZCBy
ZXN1Ym1pdHRpbmcKdGhlIHBhdGNoIHNlcmllcyBub3cuCgotLSAKTWF0dGhldyBCb2Jyb3dza2kK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
