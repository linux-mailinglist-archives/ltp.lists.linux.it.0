Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNd0DH7dhWn4HQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:24:30 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B5AFD94E
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 13:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770380668; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=R7/+C+nBBIq4xw40psvXuhVOSZTk18pevdPDFS6JlOM=;
 b=DtV3LeNgFgg+5ORKue8jK5utZzCnhkfa7xrOX9FntfjRB/AWvNvbZ7MIn46TdmpGgfySx
 ZgrwtvOTLeHMEBHHDfW8KfMohiFEf0/Xyp4bL1I+pIsDCP9dAEAgAwilFzygS8TUus1sPMO
 3XfzpFnqQ/qdTFAuX7Su4EXOORpg7nI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF16A3CCA81
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 13:24:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 043CD3C1C05
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:24:15 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 508571A010DA
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 13:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770380652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sx5eCU25hjbHpkIpXBbsgwi8AyozTsR3+pBz8dQRUFk=;
 b=iRiG08rBVUJvALJpcPTdOv8lS+ZOa8vs47lm97LBVSL46ADIXh7r1Y79XPlrKOQMRNpyMP
 h3zc7ku6bEkT6XEgz9tjbXIPjDvq/MvBpSvSPgymRECyVMeGrJLx+2gRsTV0NPzPtXFV/Y
 vLwwWFtIXMabfR84hRfDLXs9X129n/s=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-DjqOaqHdNja64d76dUpE6w-1; Fri, 06 Feb 2026 07:24:11 -0500
X-MC-Unique: DjqOaqHdNja64d76dUpE6w-1
X-Mimecast-MFC-AGG-ID: DjqOaqHdNja64d76dUpE6w_1770380650
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b708fa4093so3865563eec.0
 for <ltp@lists.linux.it>; Fri, 06 Feb 2026 04:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770380650; x=1770985450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sx5eCU25hjbHpkIpXBbsgwi8AyozTsR3+pBz8dQRUFk=;
 b=VbG9iAvQxUXvdMsY8XNHHea2qtGOpOzhENeMmWe+9oR3veVW5eVCZTzkjMMVu/PMhq
 pqib23rXgcEcqqKlqDYINf8ww9iFkeNvnGt+ByTbotx4TiJmXm5cEDd3kPiLajcOYVEK
 zXgrJxo7vasyUPRb19N+H7BQUu7N5DWzsmHTuJh2BJPp2vrrhIRaMvtY99GN+dk4zcxS
 YfJTIEzFPx0fX7PH6mK5XBTvP2I/t1XkiTRUPk0HyKgmISTatVwgGUooLKwgm1PvLmEb
 ajrYaJnHKoTNUHVMTp5ynI1jZSkvVIAoctwQzO5N06JcFfHjJXdmGJOQ+PAZC2Ek+fjL
 Q33Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUVqw5ODNcVtnFQhXNhoLSlk2PfYaYlxB0Ze+YBWq7jeP/NhrMb7jocMzKp5zuXdaq+Vo=@lists.linux.it
X-Gm-Message-State: AOJu0YxLY/OKqZNde0i7CfEqU3mjQTvHeoxIJFc+PI5CUTSL77B+SEga
 sEXAF02pn8o3gKdrCSxqLUfgSV2eTbjBcVaUsYWwOFyxoTTPsx7rQirtj3TId0BEsxV+6znIrG7
 hxPOMJtWQ+u6XwtfPqFAA+EFDR1IqlKul342OBI8Xp0yiLNmaoGdt2MH5H2OyHER30zm/UcD5C3
 lS9tNCHt5vjsa3KqpuLoeQY/YOGFA=
X-Gm-Gg: AZuq6aKGOXNckA4dxC46Tq1OCWn7qGz2spS6OwwbbSvVGZtidyz+1Ve19bbWNlkBRtL
 w6ESc/rq/OAvXt7WQjL9M+FQEmCF8wbKafMYODpVmdtYF65xL03VudjmqqKE79K8c1SH2tzaRjV
 mLLJN+6qrqC3PBmNneVgC3VIbhGJyZQ7fCkzpofDE9d0iqKMgqZKqExz8BfHROXBmWqmUGN+UYd
 J9MlIU=
X-Received: by 2002:a05:7300:8c03:b0:2b7:fdb6:ccf2 with SMTP id
 5a478bee46e88-2b856484d25mr1235020eec.13.1770380649853; 
 Fri, 06 Feb 2026 04:24:09 -0800 (PST)
X-Received: by 2002:a05:7300:8c03:b0:2b7:fdb6:ccf2 with SMTP id
 5a478bee46e88-2b856484d25mr1235008eec.13.1770380649393; Fri, 06 Feb 2026
 04:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20260205135724.23772-1-chrubis@suse.cz>
 <20260205174756.GA338897@pevik>
 <aYWfNaJeXqut0Isb@redhat.com> <20260206082303.GA364017@pevik>
In-Reply-To: <20260206082303.GA364017@pevik>
Date: Fri, 6 Feb 2026 20:23:56 +0800
X-Gm-Features: AZwV_QgkQNdA6LinrBfTjHqL9bZNmPsuwpYY5fqto_wbeP2Zr5dWUBCOavm0DGQ
Message-ID: <CAEemH2fDFBzoMvkZ_ZDPFCZVyMn2Dq0Ro6xBLTELRTK24Ey6eg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yFDLwkuCA_Y_R2-4ffdMrEUfvVNC1xt0A-xeAssO1Xk_1770380650
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] lib: tst_kconfig: Add runtime checks
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.it:url]
X-Rspamd-Queue-Id: B6B5AFD94E
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgNiwgMjAyNiBhdCA0OjIz4oCvUE0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+IHdyb3RlOgoKPiA+ID4gPiArc3RhdGljIHZvaWQgcnVudGltZV9jaGVjayhzdHJ1Y3QgdHN0
X2tjb25maWdfdmFyICp2YXIpCj4gPiA+ID4gK3sKPiA+ID4gPiArIHNpemVfdCBpOwo+ID4gPiA+
ICsKPiA+ID4gPiArIGZvciAoaSA9IDA7IHJ1bnRpbWVfY2hlY2tzW2ldLmNvbmZpZzsgaSsrKSB7
Cj4gPiA+ID4gKyAgICAgICAgIGlmIChzdHJjbXAocnVudGltZV9jaGVja3NbaV0uY29uZmlnLCB2
YXItPmlkKSkKPiA+ID4gPiArICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiArCj4g
PiA+ID4gKyAgICAgICAgIHRzdF9yZXMoVERFQlVHLCAiUnVubmluZyBydW50aW1lIGNoZWNrIGZv
ciAnJXMnIiwgdmFyLT5pZCk7Cj4gPiA+IFRoaXMgd2lsbCBub3Qgd29yayBzaW5jZSBMaSdzIGNo
YW5nZToKPiA+ID4gYWE1YTZmY2RjZCAoImxpYjogc3VwcHJlc3MgZWFybHkgVERFQlVHIG91dHB1
dCBiZWZvcmUgY29udGV4dAo+IGluaXRpYWxpemF0aW9uIikKPgo+ID4gPiBATGkgSSdtIG5vdCBz
dXJlIHdoYXQgInVubGVzcyBleHBsaWNpdGx5IGVuYWJsZWQiIG1lYW5zLCBidXQgSSBndWVzcwo+
IHdlIGNhbm5vdAo+ID4gPiBzaW1wbGUgZW5hYmxlIGl0IGZvciB0aGUgdGVzdCBsaWJyYXJ5IChm
b2xsb3dpbmcgcGF0Y2gpLiBJIHZvdGUgdG8KPiBlaXRoZXIgcmV2ZXJ0Cj4gPiA+IGFhNWE2ZmNk
Y2Qgb3IgY2hhbmdlIGl0IChlZmZlY3RpdmVseSByZXZlcnQgaXQsIGJ1dCBrZWVwIGRvYyBhbmQg
dGhlCj4gcmVzdCBvZiB0aGUKPiA+ID4gY29kZSkuCj4KPiA+ID4gSSB1bmRlcnN0YW5kIGhhdmlu
ZyB0aGUgb3V0cHV0IGluIGVhY2ggdGVzdCBpcyBub3QgaWRlYWw6Cj4KPiA+ID4gdXRzbmFtZTAx
LmM6Mzk6IFRERUJVRzogbW1hcCgobmlsKSwgNjQsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUoMyks
IDMzLAo+IC0xLCAwKQo+ID4gPiB1dHNuYW1lMDEuYzo0MDogVERFQlVHOiBtbWFwKChuaWwpLCA2
NCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSgzKSwgMzMsCj4gLTEsIDApCj4KPiA+ID4gYnV0IGJl
dHRlciBtb3JlIG91dHB1dCBjb2RlIHRoYW4gbm8gY29kZS4KPgo+ID4gV2VsbCwgSSBkb24ndCBs
aWtlIHRoYXQgbm9pc3kgbG9nZ2luZyBzdHlsZSwgdGhhdCdzIHdoeSBJIGRpZCBhYTVhNmZjZGNk
Lgo+Cj4gPiBNYXliZSBjYW4gd2UgYWRkIG1vcmUgbGV2ZWxzIG9mIFRERUJVRyBsb2cgdG8gTFRQ
Ogo+Cj4gPiAgIC1EMDogbm8gZGVidWcgbG9ncyBwcmludAo+ID4gICAtRDE6IG9ubHkgZ2VuZXJp
YyBsb2dzIHByaW50Cj4gPiAgIC1EMjogbW9yZSB2ZXJvZXMgbG9ncyBpbmNsdWRlIGxpYnJhcnkg
ZGVidWdpbmZvCj4KPiA+IFdoYXQgZG8geW91IHRoaW5rPwo+Cj4gRm9yIHRoZSBsZXZlbCB3ZSB3
b3VsZCBuZWVkIHRvIHRyYWNrIHRoZSBsZXZlbCBzdGF0ZS4KPgo+IEFsc28sIHdlIG5vdyBzdXBw
b3J0Cj4gLUQKPiBMVFBfRU5BQkxFX0RFQlVHPXkgKG9yIG4gdG8gZGlzYWJsZSkKPgo+IE5vdywg
dXNlciB3b3VsZCBoYXZlIHRvIGFsd2F5cyB1c2UgJy1EMScgb3IgJy1EMicgdG8gZ2V0IGxvZ2dp
bmcgb3Igbm90IHVzZQo+IGdldG9wdHMuIElNSE8gZ2V0b3B0cyBkb2VzIG5vdCBzdXBwb3J0IGJv
dGggJy1EJyAod2l0aG91dCB2YWx1ZSkgYW5kICctRDEnCj4gKHdpdGgKPiB2YWx1ZSkuCj4KCk5v
IG5vLCBJIHdhcyBzYXlpbmcgJy1EJyBvbmx5IGNvbnRyb2xzIHRoZSBUREVCVUcgbG9nZ2luZyBp
biBsZXZlbHMsCmJ1dCBub3QgYWZmZWN0IG5vcm1hbCBsb2dzLgpMZXZlbCAwOiBzdXBwcmVzcyBh
bGwgVERFQlVHIGluZm8KTGV2ZWwgMTogY3VycmVudCDigJxnZW5lcmlj4oCdIFRERUJVRwpMZXZl
bCAyOiB2ZXJib3NlLCBpbmNsdWRpbmcgbGlicmFyeSBUREVCVUcKClRoaXMgd291bGRuJ3QgYmUg
c28gaGFyZCB0byBhY2hpZXZlIHdpdGggcmVmYWN0b3JpbmcgdGhlICctRCcgcGFyYW1ldGVyLgoK
Cgo+Cj4gSU1ITyB0aGF0J3Mgd2h5IHNzaCBzdXBwb3J0cyBtdWx0aXBsZSAnLXYnLCBlLmcuICct
diAtdiAtdicgb3IgJy12dnYnCj4gaW5zdGVhZCBvZgo+IC12MiBvciAtdjMpLgo+Cj4gQW55d2F5
IEknZCBwcmVmZXIgc29sdmluZyB0aGlzIHNvbWVob3cgaW4gdGhlIGNvZGUgc28gdGhhdCB1c2Vy
cyBkb24ndAo+IGhhdmUgdG8KPiBib3RoZXIgYWJvdXQgbG9nIGxldmVscywgYnV0IEkgaGF2ZSBu
byBpZGVhIGhvdy4gTWF5YmUgeWV0IGFub3RoZXIgZW51bQo+IHRzdF9yZXNfZmxhZ3MgbWVtYmVy
PyBCZWNhdXNlIGFhNWE2ZmNkY2Qgc2tpcHBlZCBtZXNzYWdlcywgd2hpY2ggYXJlIGxpa2VseQo+
IHVzZWZ1bCB3aGVuIHJ1biBieSBjaGlsZCBwcm9jZXNzICh0aGUgdGVzdCksIGJ1dCBub3QgYnkg
bGlicmFyeSBwcm9jZXNzLgo+IEFuZCBJCj4gd2FudCB0byBwcmludCBtZXNzYWdlIHdoaWNoIGlz
IGFsd2F5cyBydW4gYnkgbGlicmFyeSBwcm9jZXNzLiBNYXliZSB0bwo+IGhhdmUgc29tZQo+ICNk
ZWZpbmUgaW4gc291cmNlIGNvZGUsIHdoaWNoIHdvdWxkIGZvcmNlIGxvZ2dpbmcgZXZlbiBmb3Ig
bGlicmFyeQo+IHByb2Nlc3M/IChub3QKPiBzdXJlIHdoYXQgd2lsbCBiZSBuZWVkZWQgbW9yZSBv
ZnRlbikuCj4KClRoaXMgaXMgc29tZXRoaW5nIHdvcnRoIHRoaW5raW5nIGFib3V0IGNhcmVmdWxs
eSwgYnR3LCBuZXh0IHdlZWsgaXMKb3VyIHNwcmluZyBmZXN0aXZhbCBob2RheS4gSSBtYXliZSBy
ZXBseSB5b3UgYSBiaXQgbGF0ZXIgOikuCgoKPgo+IEJ1dCBzdXJlLCB0aGlzIHdvdWxkIHdvcmsg
aWYgdGhlcmUgbm8gb3RoZXIgd2F5IHRvIGRldGVjdCB0aGVzZSAyIGNhc2VzLgo+Cj4gT1Qgd2Ug
aGF2ZToKPgo+IGluIHRzdF90ZXN0LmM6Cj4KPiAgICAgICAgIGlmIChjb250ZXh0LT50ZGVidWcp
Cj4gICAgICAgICAgICAgICAgIHRzdF9yZXMoVElORk8sICJSZXN0b3JlZCBtZXRhZGF0YSBmb3Ig
UElEICVkIiwgZ2V0cGlkKCkpOwo+Cj4gPT4gc2hvdWxkbid0IGl0IHVzZSBUREVCVUcgaW5zdGVh
ZCBvZiBUSU5GTz8KPgoKWWVzLCB0aGF0J3MgYSB0eXBvLgoKCi0tIApSZWdhcmRzLApMaSBXYW5n
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==
