Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF5010362E
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 09:45:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61A6D3C23E7
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 09:45:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7EB1D3C1448
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 13:51:03 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D9A9E14011B1
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 13:51:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574167861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEDKMyayCUjPgIE9DPZezHt4FnuO8rXLJV/h7E1JGa4=;
 b=PO812zvJNrY55ow5Ps2+oLSwVuLmJ2BSodzgRR2XK51t96kHpu6KB9kcXpNCY997i9E0c+
 1wxLfJEuhWP/tbVRgGDpBvDzJsJMIw2vFs9R/+hpkDnDEjZrh8s6sJsxJV3432WpqxWRnx
 LXGs3+AnXOeOru9kPNzwt91zfz1rtvM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-ij5aVq-cMcajVo7txNCSpQ-1; Tue, 19 Nov 2019 07:50:59 -0500
Received: by mail-qk1-f199.google.com with SMTP id 64so13534912qkm.5
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 04:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0yQRjcMF4pMatebKNWPD4GsrcfBYND0A2pjfYAUpEs=;
 b=i1zO1LOAglzj86wBXGOi4BcKX0FaGH8HfWkN0sf6l/f6fG5j2cRaTXpD/oGWdgtlTz
 x7jJ+oTou9cTSi1KnJ8oZJYR8eHz8Tiyp0rqBJ5EEBt6exM0n3dQru75+kXIt0tnDOl4
 WO4dR16CsABJtdNbBTdZ3shRoiDKeqxFBGx9NfLWwdJLm3s/4w7FSFvTquximlnV4SQu
 XVyS3256fz4Or5d3ngrtSeDDnXd+XCZ8cNDxmogfKVQMDNEvLv0i7rFDc3FJhN+7n7HK
 01HGyVcQyBIEaZVcgi3tyNrsIfyQurh0ctxJaVB5COBTeepyj/zrRZFEk68zlVnNj5Pf
 3kGg==
X-Gm-Message-State: APjAAAVnooPDe912NvfjLKg5KLTdnZ/uSJ9LLj3vXhwZRoCgwqOFSr6b
 ESHJeyarcbPtkSSfWlLT9vreJ/0Ymiw1H1Hh53yo/5XbT9BYjW2S5diMt0klY17ohQr86GBeCbC
 TeJaaEWRR3E0=
X-Received: by 2002:a37:a650:: with SMTP id p77mr16155376qke.188.1574167858828; 
 Tue, 19 Nov 2019 04:50:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVpYrDtpqXfgyAR+mYTNqB981fhGl1zI6Y1Vd4W3jPJ7xhLz3f71eKnWfrx6kT2ISTRX8K8w==
X-Received: by 2002:a37:a650:: with SMTP id p77mr16155348qke.188.1574167858384; 
 Tue, 19 Nov 2019 04:50:58 -0800 (PST)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net.
 [96.235.39.235])
 by smtp.gmail.com with ESMTPSA id k65sm11891302qtd.14.2019.11.19.04.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 04:50:57 -0800 (PST)
To: Greg KH <greg@kroah.com>
References: <cki.042792963E.5VOWULC1Q9@redhat.com>
 <8e0fa6de-b6b1-23ac-9e77-d425c8d1ba22@redhat.com>
 <c326c35e-453e-2dae-391c-5324803e6112@redhat.com>
 <20191119124428.GC1975017@kroah.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <236c4f8d-a54e-daa6-0896-eca236e23e58@redhat.com>
Date: Tue, 19 Nov 2019 07:50:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119124428.GC1975017@kroah.com>
Content-Language: en-US
X-MC-Unique: ij5aVq-cMcajVo7txNCSpQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 20 Nov 2019 09:45:31 +0100
Subject: Re: [LTP] =?utf-8?b?4p2MIEZBSUw6IFN0YWJsZSBxdWV1ZTogcXVldWUtNS4z?=
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
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTEvMTkvMTkgNzo0NCBBTSwgR3JlZyBLSCB3cm90ZToKPiBPbiBUdWUsIE5vdiAxOSwgMjAx
OSBhdCAwNzozNzowOUFNIC0wNTAwLCBMYXVyYSBBYmJvdHQgd3JvdGU6Cj4+IE9uIDExLzE4LzE5
IDc6MDcgUE0sIFJhY2hlbCBTaWJsZXkgd3JvdGU6Cj4+Pgo+Pj4gT24gMTEvMTgvMTkgMTA6MDAg
QU0sIENLSSBQcm9qZWN0IHdyb3RlOgo+Pj4+IEhlbGxvLAo+Pj4+Cj4+Pj4gV2UgcmFuIGF1dG9t
YXRlZCB0ZXN0cyBvbiBhIHBhdGNoc2V0IHRoYXQgd2FzIHByb3Bvc2VkIGZvciBtZXJnaW5nIGlu
dG8gdGhpcwo+Pj4+IGtlcm5lbCB0cmVlLiBUaGUgcGF0Y2hlcyB3ZXJlIGFwcGxpZWQgdG86Cj4+
Pj4KPj4+PiAgICAgICAgICBLZXJuZWwgcmVwbzpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0Cj4+Pj4gICAgICAgICAgICAgICBD
b21taXQ6IDExNmEzOTViNzA2MSAtIExpbnV4IDUuMy4xMQo+Pj4+Cj4+Pj4gVGhlIHJlc3VsdHMg
b2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxvdy4KPj4+Pgo+Pj4+ICAg
ICAgIE92ZXJhbGwgcmVzdWx0OiBGQUlMRUQgKHNlZSBkZXRhaWxzIGJlbG93KQo+Pj4+ICAgICAg
ICAgICAgICAgIE1lcmdlOiBPSwo+Pj4+ICAgICAgICAgICAgICBDb21waWxlOiBPSwo+Pj4+ICAg
ICAgICAgICAgICAgIFRlc3RzOiBGQUlMRUQKPj4+Pgo+Pj4+IEFsbCBrZXJuZWwgYmluYXJpZXMs
IGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQgaGVyZToK
Pj4+Pgo+Pj4+ICAgICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxpbmVz
LzI5MzA2Mwo+Pj4+Cj4+Pj4gT25lIG9yIG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPj4+Pgo+
Pj4+ICAgICAgIGFhcmNoNjQ6Cj4+Pj4gICAgICAgIOKdjCBMVFAgbGl0ZQo+Pj4KPj4+IEkgc2Vl
IGEgcGFuaWMgd2hlbiBpbnN0YWxsaW5nIHRoZSBMVFAgZGVwZW5kZW5jaWVzCj4+Pgo+Pj4gWyAg
NjkwLjYyNTA2MF0gQ2FsbCB0cmFjZToKPj4+IFsgIDY5MC42Mjc0OTVdICBiZnFfZmluZF9zZXRf
Z3JvdXArMHg4Yy8weGYwCj4+PiBbICA2OTAuNjMxNDkxXSAgYmZxX2JpY191cGRhdGVfY2dyb3Vw
KzB4YmMvMHgyMTgKPj4+IFsgIDY5MC42MzU4MzRdICBiZnFfaW5pdF9ycSsweGFjLzB4ODA4Cj4+
PiBbICA2OTAuNjM5MzA5XSAgYmZxX2luc2VydF9yZXF1ZXN0LmlzcmEuMCsweGUwLzB4MjAwCj4+
PiBbICA2OTAuNjQzOTk5XSAgYmZxX2luc2VydF9yZXF1ZXN0cysweDY4LzB4ODgKPj4+IFsgIDY5
MC42NDgwODVdICBibGtfbXFfc2NoZWRfaW5zZXJ0X3JlcXVlc3RzKzB4ODQvMHgxNDAKPj4+IFsg
IDY5MC42NTMwMzZdICBibGtfbXFfZmx1c2hfcGx1Z19saXN0KzB4MTcwLzB4MmIwCj4+PiBbICA2
OTAuNjU3NTU1XSAgYmxrX2ZsdXNoX3BsdWdfbGlzdCsweGVjLzB4MTAwCj4+PiBbICA2OTAuNjYx
NzI1XSAgYmxrX21xX21ha2VfcmVxdWVzdCsweDIwMC8weDVlOAo+Pj4gWyAgNjkwLjY2NTk4Ml0g
IGdlbmVyaWNfbWFrZV9yZXF1ZXN0KzB4OTQvMHgyNzAKPj4+IFsgIDY5MC42NzAyMzldICBzdWJt
aXRfYmlvKzB4MzQvMHgxNjgKPj4+IFsgIDY5MC42NzM3MTJdICB4ZnNfc3VibWl0X2lvZW5kLmlz
cmEuMCsweDljLzB4MTgwIFt4ZnNdCj4+PiBbICA2OTAuNjc4Nzk4XSAgeGZzX2RvX3dyaXRlcGFn
ZSsweDIzNC8weDQ1OCBbeGZzXQo+Pj4gWyAgNjkwLjY4MzMxOF0gIHdyaXRlX2NhY2hlX3BhZ2Vz
KzB4MWE0LzB4M2Y4Cj4+PiBbICA2OTAuNjg3NDQyXSAgeGZzX3ZtX3dyaXRlcGFnZXMrMHg4NC8w
eGI4IFt4ZnNdCj4+PiBbICA2OTAuNjkxODc0XSAgZG9fd3JpdGVwYWdlcysweDNjLzB4ZTAKPj4+
IFsgIDY5MC42OTU0MzhdICBfX3dyaXRlYmFja19zaW5nbGVfaW5vZGUrMHg0OC8weDQ0MAo+Pj4g
WyAgNjkwLjcwMDA0Ml0gIHdyaXRlYmFja19zYl9pbm9kZXMrMHgxZWMvMHg0YjAKPj4+IFsgIDY5
MC43MDQyOThdICBfX3dyaXRlYmFja19pbm9kZXNfd2IrMHg1MC8weGU4Cj4+PiBbICA2OTAuNzA4
NTU1XSAgd2Jfd3JpdGViYWNrKzB4MjY0LzB4Mzg4Cj4+PiBbICA2OTAuNzEyMjA0XSAgd2JfZG9f
d3JpdGViYWNrKzB4MzAwLzB4MzU4Cj4+PiBbICA2OTAuNzE2MTEzXSAgd2Jfd29ya2ZuKzB4ODAv
MHgxZTAKPj4+IFsgIDY5MC43MTk0MThdICBwcm9jZXNzX29uZV93b3JrKzB4MWJjLzB4M2U4Cj4+
PiBbICA2OTAuNzIzNDE0XSAgd29ya2VyX3RocmVhZCsweDU0LzB4NDQwCj4+PiBbICA2OTAuNzI3
MDY0XSAga3RocmVhZCsweDEwNC8weDEzMAo+Pj4gWyAgNjkwLjczMDI4MV0gIHJldF9mcm9tX2Zv
cmsrMHgxMC8weDE4Cj4+PiBbICA2OTAuNzMzODQ3XSBDb2RlOiBlYjAwMDA3ZiA1NDAwMDIyMCBi
NDAwMDA0MCBmODU2ODAyMiAoZjk0MDFjNDIpCj4+PiBbICA2OTAuNzM5OTI4XSAtLS1bIGVuZCB0
cmFjZSBkM2ZkMzkyZjU2OWU4NmQzIF0tLS0KPj4+Cj4+PiBodHRwczovL2FydGlmYWN0cy5ja2kt
cHJvamVjdC5vcmcvcGlwZWxpbmVzLzI5MzA2My9sb2dzL2FhcmNoNjRfaG9zdF8yX2NvbnNvbGUu
bG9nCj4+Pgo+Pgo+PiBUaGlzIGxvb2tzIGxpa2UgdGhhdCBzYW1lIGlzc3VlCj4+IGh0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTc2NzUzOQo+Pgo+PiBJIGRvbid0
IHRoaW5rIHRoZSBCRlEgZml4IGhhcyBiZWVuIHNlbnQgdG8gc3RhYmxlIHlldCwgb3IgYXQgbGVh
c3QKPj4gaXQgd2FzIG5vdCBpbiA1LjMuMTEKPiAKPiBBbnkgc3BlY2lmaWMgZ2l0IGNvbW1pdCBp
ZCBJIHNob3VsZCBiZSBwaWNraW5nIHVwIGZvciB0aGlzPwo+IAo+IHRoYW5rcywKPiAKPiBncmVn
IGstaAo+IAoKU2hvdWxkIGJlIDQ3OGRlMzM4MGMxYyAoImJsb2NrLCBiZnE6IGRlc2NoZWR1bGUg
ZW1wdHkgYmZxX3F1ZXVlcwpub3QgcmVmZXJyZWQgYnkgYW55IHByb2Nlc3MiKSAuCgpUaGFua3Ms
CkxhdXJhCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
