Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB763FE61
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Dec 2022 03:54:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2A3D3CC4C4
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Dec 2022 03:54:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6B8C63CC4B2
 for <ltp@lists.linux.it>; Fri,  2 Dec 2022 03:54:07 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6ED0912A53A6
 for <ltp@lists.linux.it>; Fri,  2 Dec 2022 03:54:05 +0100 (CET)
Received: from canpemm500006.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NNcvK2K7MzHw3V
 for <ltp@lists.linux.it>; Fri,  2 Dec 2022 10:53:17 +0800 (CST)
Received: from canpemm500005.china.huawei.com (7.192.104.229) by
 canpemm500006.china.huawei.com (7.192.105.130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Dec 2022 10:54:01 +0800
Received: from canpemm500005.china.huawei.com ([7.192.104.229]) by
 canpemm500005.china.huawei.com ([7.192.104.229]) with mapi id 15.01.2375.031; 
 Fri, 2 Dec 2022 10:54:01 +0800
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v2 1/2] lib/safe_macros: Add SAFE_STRTOF
Thread-Index: AdkF9o4UB/k8KYOPSBi9wCJSpVLWIgAAOw3Q
Date: Fri, 2 Dec 2022 02:54:01 +0000
Message-ID: <e9275edb756041e3acb64c6e9a4ec0b3@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib/safe_macros: Add SAFE_STRTOF
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
From: zhaogongyi via ltp <ltp@lists.linux.it>
Reply-To: zhaogongyi <zhaogongyi@huawei.com>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> 
> > Hi!
> > > +float safe_strtof(const char *file, const int lineno,
> > > +		  void (cleanup_fn) (void), char *str,
> > > +		  float min, float max)
> > > +{
> > > +	float rval;
> > > +	char *endptr;
> > > +
> > > +	errno = 0;
> > > +	rval = strtof(str, &endptr);
> > > +
> > > +	if ((errno == ERANGE) || (rval == 0)
> > > +	    || (rval == HUGE_VAL) || (rval == -HUGE_VAL)) {
> >
> > This does not look right, supposedly the ERANGE is only set on
> > overflow, and the rval is not guaranteed to be exact on underflow.
> > Also rval == 0 is a valid result.
> >
> 
> According to man 3 strtof, it seems there are some cases like:
> 
> 1. strtof return the converted value as normal 2. strtof return 0 when no
> conversion is performed, and endptr == nptr:  'rval == 0'
> 3. strtof return HUGE_VAL or -HUGE_VAL when overflow:      '(rval ==
> HUGE_VAL) || (rval == -HUGE_VAL)'
> 4. strtof retrun 0 and set errno to ERANGE when underflow:   'errno ==
> ERANGE'
> 
> 
> For 2, it seems need to add checking of endptr when 'rval == 0' like:  (rval
> == 0 && !strcmp(endptr, nptr)
> 
> Other places seem to be fine.
> 
> 

The exception cases may be described as:

 1. strtof return 0 when no conversion is performed, and endptr == nptr:  'rval == 0 && !strcmp(endptr, nptr)'

 2. strtof return HUGE_VAL or -HUGE_VAL when overflow:      '((rval ==HUGE_VAL) || (rval == -HUGE_VAL)) && errno == ERANGE'

 3. strtof retrun 0 and set errno to ERANGE when underflow:   'errno ==ERANGE && rval == 0'


So it may be write as:
	If (( errno == ERANGE && (rval == HUGE_VAL || rval == -HUGE_VAL || rval == 0))
	   || (rval == 0 && !strcmp(endptr, nptr)))

If the description as above is ok, I will resubmit the patch.

Regards,
Gongyi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
