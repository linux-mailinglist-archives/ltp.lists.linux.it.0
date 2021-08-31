Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B83EF3FC1B3
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 05:56:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455B73C9B65
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 05:56:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 708383C2ABC
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 05:56:08 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-ty1jpn01olkn0155.outbound.protection.outlook.com [104.47.93.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CEB2D200772
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 05:56:06 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNDwgX90NiLSsJFT6gsqIsD3aQ43bXFsl95armvCLAYBNYzQbVVd7JOTAAJ4NjQFRebW+Y86JiPUXlp4wJ8IJPe4crfMKSVdzOItuKqx2YHdONaTQ78gHSeGU7gAU64qEjS4pPH+mSgJy3cueCU3AjLz41krowtANwEFGpVwbsdrZRmPlsrGHykO3p9/rk9kokFqvq/nDrOkSQrusu2d4fKpT9puW1aNKS75IdTpnr+t+B6uEoCF/eOSGEq/Pvhx+xjHKEgwxZ7Oa44THwklZtSCeK71oMqdV5zttEP+JhUS5jVupw5417VtJnfh+aVLdLrXxDp+Yz8YRWwS4aSugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StZF25sHpIuoir9A+5jMPTGrgOfLB5p0X38FLSa2Mzc=;
 b=Fo4JvpDcs5B23nquSYdx/A/EukGESV77eZYOqYKvDxYezPJcfnLyvEpwXM59g05UYxxG+gxusknaLoieORPbF494VciboG92sx9cAyuNPzH2a6Zm4mfkCshHP8Eu5VR3/huwI3uI1TFTnfUeuZVQgP/UOr/exAtRdQkyNT0TM3DBPCBmeyCRUDp11e2RaTwpYkkU0Yd6N9TLfjLJmNl/egNc4Nco6JrO/mmvqLaQlTY/a8w7snLbhlFCOlXsL1iTui1xZIrCt2gHqb4w5gN2C88xbA3HdPALSvA8uDbt1A8D3/QM/MixKUfzwuWyT39nZm+AqfW3VbQA+KNr4Try7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StZF25sHpIuoir9A+5jMPTGrgOfLB5p0X38FLSa2Mzc=;
 b=Dw/P7GbZWh0FiK7wADJzE34C12s3hVEfrI1ckgPqLKlZCNS8O3wxLg2fkwW3Dsnv4rJ+wYBDklhhRyQui/3akgJFpySB1a0YcYHuHx8WalcDk8krgW3ffz2TwHfkeQmHDRYehha1ANY459v3TpdP5Q/ygqMClfv4SZaOoTCs+3VjBAtiZ7mX1aP8K5QCd7VUcoxzJl1h2m2oR78vG14RdJh+mrqQSckZFQKXEMkq58suPQIGmUDIou0NI6XYOQ8s698MGo1xboYGdZF49WSBiSm3j9Iy8l3eGiT9Yr7XUl0xE4fvr9QceFQs4Eb15+Nx7kt3OFPClA4Cb3qabAmPjg==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OS0P286MB0163.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 03:56:02 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 03:56:02 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <OSZP286MB087168E8DE5E0E49C9F90E27CCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
 <YSzwIwm7q533tlpD@yuki>
 <OSZP286MB0871D6BC61046333773018F1CCCB9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <OSZP286MB0871C671A5B63B0355111DB3CCCC9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Date: Tue, 31 Aug 2021 11:55:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
In-Reply-To: <OSZP286MB0871D6BC61046333773018F1CCCB9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
X-TMN: [DqZWjmCbKAw9iPKG+Ixgp9gnw6EMmtRP]
X-ClientProxiedBy: HK0PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:203:b0::13) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <8f775b03-fe4d-f0a0-1c2c-fc5db4f0048a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ZiyaodeMacBook-Pro.local (14.192.49.77) by
 HK0PR03CA0097.apcprd03.prod.outlook.com (2603:1096:203:b0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 03:56:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d72c5560-0e9b-4e80-8521-08d96c334042
X-MS-TrafficTypeDiagnostic: OS0P286MB0163:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rw0V0gn3O1/5EKVX2nxl+FeZIiOIGrJG4uQvmqc+i0yCfyg4dbyyrCs6X9YZny7yzknqhJv9MbdmYyhaGf1K/RhOJSwtiqneNVCzYnly/o+mabg1eSMnm2sS4Np0G2R6NGdzhPwdR8EulRWbbq0Rdv/N2G4jSbsl/mSbjNhfr2eQn+IMIyUr9zPl+V7EeaF6Ih/GB7U/lj0NEKyW+F0W1OoPdAzriijzlqc1cQpeici2ixt72dIrqPuPHOl0s65VQvIusTy2zhxhwfMRlffDgpHaHOSvEZuhwaw5wI1I45yajuIP8AA9GisXUGruAijlLJNl3aDMZhi+92Dqx8EHR4MhWr9A2XAED7pfmAGAuYgrf83ZcVKvyy/xkB+pWqcxDNvCek/wEUG4jQyHKHv6X9edNfV92JVVFj+8tCFT4wky6ALFBmcOKQEVEKy8sPTmkSTLhTw7Vr9Y1Dxu3rSXm9C6OuNwl7N3kh2KF6rhOLU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8syMBnzmj+OWv73I3V9bjPQeuXjrC+sEqIve/1T2gbxbgw4+DhUJWioCxGC6h9gOKBKsfwZQLNACtjZIQZK6rkmYOTWdpYa+xgm6jBxMONARMWRvy4eR0SCYt414lCjG7/RIhDDaOVHCJ/nK0YWZ7g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72c5560-0e9b-4e80-8521-08d96c334042
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 03:56:02.8352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0163
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] epoll_creat01: Replace TST_PASS with TST_RET
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgo+IEhpLCBDeXJpbCwKPgo+PiBIaSEKPj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2Vy
bmVsL3N5c2NhbGxzL2Vwb2xsX2NyZWF0ZS9lcG9sbF9jcmVhdGUwMS5jIAo+Pj4gYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2Vwb2xsX2NyZWF0ZS9lcG9sbF9jcmVhdGUwMS5jCj4+PiBpbmRl
eCA1NGZkMDgxMGQuLjI5YWMzNzYzZSAxMDA2NDQKPj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvZXBvbGxfY3JlYXRlL2Vwb2xsX2NyZWF0ZTAxLmMKPj4+ICsrKyBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvZXBvbGxfY3JlYXRlL2Vwb2xsX2NyZWF0ZTAxLmMKPj4+IEBAIC0y
Niw5ICsyNiw4IEBAIHN0YXRpYyB2b2lkIHJ1bih1bnNpZ25lZCBpbnQgbikKPj4+IMKgIHsKPj4+
IMKgwqDCoMKgwqAgVFNUX0VYUF9GRCh0c3Rfc3lzY2FsbChfX05SX2Vwb2xsX2NyZWF0ZSwgdGNb
bl0pLCAKPj4+ICJlcG9sbF9jcmVhdGUoJWQpIiwgdGNbbl0pOwo+Pj4KPj4+IC3CoMKgwqAgaWYg
KCFUU1RfUEFTUykKPj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+PiAtwqDCoMKgIFNBRkVf
Q0xPU0UoVFNUX1BBU1MpOwo+Pj4gK8KgwqDCoCBpZiAoVFNUX1JFVCkKPj4+ICvCoMKgwqDCoMKg
wqDCoCBTQUZFX0NMT1NFKFRTVF9SRVQpOwo+Pj4gwqAgfQo+PiBJc24ndCB0aGlzIGJyb2tlbiBh
cyB3ZWxsPwo+Pgo+PiBBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGUgaWYgKCFUU1RfUEFTUykgcGFy
dCBpbiB0aGUgdGVzdCBpcyBjb3JyZWN0IGFuZAo+PiB3ZSBvbmx5IGhhdmUgdG8gY2hhbmdlIHRo
ZSBUU1RfUEFTUyB0byBUU1RfUkVUIGluIHRoZSBTQUZFX0NMT1NFKCkuCj4KPiBBZ3JlZSB3aXRo
IHlvdS4gQnkgdGhlIHdheSwgd291bGQgeW91IG1pbmQgaGVscGluZyB0byBtb2RpZnkgaXQ/CgpJ
IGhlbHBlZCBtb2RpZnkgaXQsIGFuZCB0aGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKUGxlYXNlIHNl
ZTogCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9sdHAvcGF0Y2gvT1NaUDI4
Nk1CMDg3MTYyMENGRTVGOUFCMEQ2RjMzQkQ5Q0NDQzlAT1NaUDI4Nk1CMDg3MS5KUE5QMjg2LlBS
T0QuT1VUTE9PSy5DT00vCgo+Cj4gVGhhbmtzIGEgbG90Lgo+Cj4+Cj4+IFNvIHdlIHNob3VsZCBh
cHBseToKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZXBvbGxf
Y3JlYXRlL2Vwb2xsX2NyZWF0ZTAxLmMgCj4+IGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9l
cG9sbF9jcmVhdGUvZXBvbGxfY3JlYXRlMDEuYwo+PiBpbmRleCA1NGZkMDgxMGQuLjNlZjViNWNh
YyAxMDA2NDQKPj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9lcG9sbF9jcmVhdGUv
ZXBvbGxfY3JlYXRlMDEuYwo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Vwb2xs
X2NyZWF0ZS9lcG9sbF9jcmVhdGUwMS5jCj4+IEBAIC0yOCw3ICsyOCw3IEBAIHN0YXRpYyB2b2lk
IHJ1bih1bnNpZ25lZCBpbnQgbikKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIVRTVF9QQVNT
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+IC3CoMKgwqDC
oMKgwqAgU0FGRV9DTE9TRShUU1RfUEFTUyk7Cj4+ICvCoMKgwqDCoMKgwqAgU0FGRV9DTE9TRShU
U1RfUkVUKTsKPj4gwqAgfQo+Pgo+PiDCoCBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7
Cj4+Cj4+Ci0tIApCZXN0IFJlZ2FyZHMsClhpZSBaaXlhbwpFLW1haWw6IHppeWFveGllQG91dGxv
b2suY29tCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
