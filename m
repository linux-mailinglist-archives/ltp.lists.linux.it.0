Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E6160D3E
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:29:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8A133C23DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:29:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 5FAFD3C23A6
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:29:36 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6D48C1000CAA
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:29:35 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id 2so8423124pfg.12
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 00:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=a23TZrX7I8X8s7C/zzaPztZg+JoAqmnHPtuj86wWLVU=;
 b=vdYKeOupDDKtuJifhBq5KsGESwu8p2acFDf9AusTf40/6hgQ5/okoZZ46ISheH//Ue
 7L0O++gzUPAQnUlGk0IsD8Wbbbzi4B4ZACqTSmF3PfmYADxQ/VqPxyiUUtamHR1taOuu
 T3xGUg/Tt9925bvN0uju78ROH5Vi9U1YpNuBDOLU7w73UwtCCdVxvDJt4wuAjGUGHFef
 SiYNfXn0gFJNDfu0uQMHVXy3kQzTDvrJ74UE8IhC00eN/VVEQa+K1f2Wtv/v0o//Sl8b
 6gJv0McC5VQJwHJjpjNayjm/eZ2IpEnKVax7d0dF7oyxcHgAB5yHSfPwn8epjs8xHZH5
 HHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=a23TZrX7I8X8s7C/zzaPztZg+JoAqmnHPtuj86wWLVU=;
 b=czPJykr6v13z6HmUp0VX37fIdU8uYKKvleeBwRNZsNm8B4kw7MP1VGidkrrnVEPoxm
 L7/G0UGAMBbYoKV8DWwqyE2JNHGdYbKtpKK5J8CmeRgOAVE7GBU6pkRr+0iagFQ7xgfC
 OMkGR9dI3BAf+uKyJ4WFf0W8dT4RnGbF8DjQHkGasH7mcZz6o5cOnRqJZF8T5378DdNL
 TCxE4SPQmLh5bcj3j1Fa+t9k7WNM5qFWGeaUuOpdDR5M2xBd5UOL9h9KV6pUGQrggAkO
 CAGeLdLPJIKx5rCaNKZiQmyQgxMTJTIWsj8sC4UCwiHrAoPqHv/Z6zBC2+aloZDVUapc
 n14A==
X-Gm-Message-State: APjAAAVMfg1F3IeKf9ZhI/n1ykPNUCu1Xrwkp6XVWgvIFYDBeofQv9yR
 Y+Vz5HpsR3YossnMG8vqJcl2BQ==
X-Google-Smtp-Source: APXvYqyGs6Fy2MWxspgBGdW/wr3DpSQe2USu8lQmksiuPYED7wzeM0advxtsujsky9GKY5Wy/f41TA==
X-Received: by 2002:aa7:9816:: with SMTP id e22mr15935974pfl.229.1581928173916; 
 Mon, 17 Feb 2020 00:29:33 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id b12sm16082091pfr.26.2020.02.17.00.29.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 00:29:32 -0800 (PST)
Date: Mon, 17 Feb 2020 13:59:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] syscalls/fsmount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTctMDItMjAsIDE2OjE3LCBMaSBXYW5nIHdyb3RlOgo+IFZpcmVzaCBLdW1hciA8dmlyZXNo
Lmt1bWFyQGxpbmFyby5vcmc+IHdyb3RlOgo+IAo+IC4uLi4KPiA+ICsvKgo+ID4gKyAqIENvcHly
aWdodCAoYykgMjAyMCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgo+ID4g
KyAqCj4gPiArICogRGVzY3JpcHRpb246Cj4gPiArICogQmFzaWMgZnNtb3VudCgpIHRlc3QuCj4g
PiArICovCj4gPiArI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gPiArI2luY2x1ZGUgImxhcGkvZnNt
b3VudC5oIgo+ID4KPiAKPiBBZGRpbmcgI2luY2x1ZGUgImxhcGkvZmNudGwuaCIgaW4gY2FzZSBv
ZiDigJhBVF9GRENXROKAmSB1bmRlY2xhcmVkLiBJdCBzZWVtcwo+IHdlIGhhdmUgdG8gZG8gdGhp
cyBmb3IgYWxsIHRoZSB0ZXN0cyBpbnZvbHZlcyAg4oCYQVRfRkRDV0TigJkuCgpteSBmc21vdW50
LmggaGVhZGVyIGluY2x1ZGVzIDxmY250bC5oPiwgd29uJ3QgdGhhdCBiZSBlbm91Z2ggPwoKPiAr
Cj4gPiArc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gPiArewo+ID4gLi4uCj4gPiArCj4gPiArICAg
ICAgIFRFU1QoZnNtb3VudChmZCwgMCwgMCkpOwo+ID4KPiAKPiBBcyB0aGlzIGZzbW91bnQwMS5j
IGlzIGR1cGxpY2F0ZWQgd2l0aCB6bGFuZ0AncyBwYXRjaCwgSSBzdWdnZXN0IHJld3JpdGluZwo+
IGFuIGVuaGFuY2VtZW50IHZlcnNpb24gbWF5YmUgbmFtZSBmc21vdW50MDIuYyB0byBjb3ZlciBt
b3JlIGZzbW91bnQKPiBhdHRyaWJ1dGVzLiBTaW5jZSBpdCBpcyBuYW1lZCBiYXNpYyBmc21vdW50
KCkgdGVzdCwgaXQgc2hvdWxkbid0IG9ubHkgdGVzdAo+IGZzbW91bnQoZmQsIDAsIDApLCByaWdo
dD8KPiAKPiArI2RlZmluZSBNT1VOVF9BVFRSX1JET05MWSAgICAgIDB4MDAwMDAwMDEgLyogTW91
bnQgcmVhZC1vbmx5ICovCj4gKyNkZWZpbmUgTU9VTlRfQVRUUl9OT1NVSUQgICAgICAweDAwMDAw
MDAyIC8qIElnbm9yZSBzdWlkIGFuZCBzZ2lkIGJpdHMgKi8KPiArI2RlZmluZSBNT1VOVF9BVFRS
X05PREVWICAgICAgIDB4MDAwMDAwMDQgLyogRGlzYWxsb3cgYWNjZXNzIHRvIGRldmljZQo+IHNw
ZWNpYWwgZmlsZXMgKi8KPiArI2RlZmluZSBNT1VOVF9BVFRSX05PRVhFQyAgICAgIDB4MDAwMDAw
MDggLyogRGlzYWxsb3cgcHJvZ3JhbSBleGVjdXRpb24gKi8KPiArI2RlZmluZSBNT1VOVF9BVFRS
X19BVElNRSAgICAgIDB4MDAwMDAwNzAgLyogU2V0dGluZyBvbiBob3cgYXRpbWUgc2hvdWxkCj4g
YmUgdXBkYXRlZCAqLwo+ICsjZGVmaW5lIE1PVU5UX0FUVFJfUkVMQVRJTUUgICAgMHgwMDAwMDAw
MCAvKiAtIFVwZGF0ZSBhdGltZSByZWxhdGl2ZSB0bwo+IG10aW1lL2N0aW1lLiAqLwo+ICsjZGVm
aW5lIE1PVU5UX0FUVFJfTk9BVElNRSAgICAgMHgwMDAwMDAxMCAvKiAtIERvIG5vdCB1cGRhdGUg
YWNjZXNzIHRpbWVzLgo+ICovCj4gKyNkZWZpbmUgTU9VTlRfQVRUUl9TVFJJQ1RBVElNRSAweDAw
MDAwMDIwIC8qIC0gQWx3YXlzIHBlcmZvcm0gYXRpbWUKPiB1cGRhdGVzICovCj4gKyNkZWZpbmUg
TU9VTlRfQVRUUl9OT0RJUkFUSU1FICAweDAwMDAwMDgwIC8qIERvIG5vdCB1cGRhdGUgZGlyZWN0
b3J5Cj4gYWNjZXNzIHRpbWVzICovCgpPa2F5LCBJIHdpbGwgZ2l2ZSBpdCBhIHRyeS4KIAo+ID4g
KyAgICAgICBpZiAoVFNUX1JFVCA9PSAtMSkKPiA+ICsgICAgICAgICAgICAgICB0c3RfYnJrKFRG
QUlMIHwgVEVSUk5PLCAiZnNtb3VudCgpIGZhaWxlZCIpOwo+ID4gKwo+ID4gKyAgICAgICBmc21m
ZCA9IFRTVF9SRVQ7Cj4gPiArCj4gPiArICAgICAgIFRFU1QobW92ZV9tb3VudChmc21mZCwgIiIs
IEFUX0ZEQ1dELCBNTlRQT0lOVCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIE1PVkVfTU9V
TlRfRl9FTVBUWV9QQVRIKSk7Cj4gPiArICAgICAgIFNBRkVfQ0xPU0UoZnNtZmQpOwo+ID4KPiAK
PiBJIGd1ZXNzIHdlIHByb2JhYmx5IG5lZWQgYSB3YXkgdG8gdmVyaWZ5IHRoZSBtb3ZlX21vdW50
KCkgZG9lcyB3b3JrLiBUaGUKPiBmdW5jdGlvbiBpc21vdW50KCkgaW4gemxhbmdAJ3MgcGF0Y2gg
Y291bGQgYmUgZXh0cmFjdGVkIGludG8gdGhlIGxpYnJhcnkgYXMKPiB0c3RfaXNtb3VudCgpIGZv
ciBhbGwgb2YgdGhlc2UgdGVzdHMuCj4gQFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PiAgV0RU
PwoKWWVhaCwgSSB3aWxsIGRvIHRoYXQuCiAKLS0gCnZpcmVzaAoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
