Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CD246880
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 16:37:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 940B83C58CD
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 16:37:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4049C3C3000
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 16:37:21 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6BA342000E6
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 16:37:20 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 58E3120B4908;
 Mon, 17 Aug 2020 07:37:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 58E3120B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1597675038;
 bh=eV/AWxZV1FrXw2fb5PQwYBji5wQXR/YIeAvGqYlOYlU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Xt4r1PXWuTeEZ5V7ta1WdLRKieqK2DgtlXlioYRUuyXf/CjfA3kSQQttUaIu/tqtn
 1DusYIHSTyWe1yh2H57jNVyQ9Hu8wx9IozwKEp8du5bVCIBiRZD/28FtaTj1FAAQcI
 pd66W98nUug36szFOhG1pRPotbN4WeecxiDzvFyM=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200817130916.27634-1-pvorel@suse.cz>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <2aa76946-02d1-17c2-557a-5a5f3bd05319@linux.microsoft.com>
Date: Mon, 17 Aug 2020 07:37:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817130916.27634-1-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-15.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/4] IMA: verify measurement of certificate
 imported into a keyring
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
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/17/20 6:09 AM, Petr Vorel wrote:

Hi Petr,

> Hi Mimi, Lakshmi,
> 
> changes v2->v3:
> fixed regression in my third commit.
> (please verify it on installed LTP, or at least run make install in
> testcases/kernel/security/integrity/ima/datafiles/ima_keys/)
> 

Verified keys tests and also kexec tests. Thanks.

Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

> 
> Lachlan Sneff (1):
>    IMA: Add a test to verify measurement of certificate imported into a
>      keyring
> 
> Petr Vorel (3):
>    IMA/ima_keys.sh: Fix policy content check usage
>    IMA: Refactor datafiles directory
>    IMA/ima_keys.sh: Enhance policy checks
> 
>   .../kernel/security/integrity/ima/README.md   |  12 +-
>   .../security/integrity/ima/datafiles/Makefile |  10 +-
>   .../ima/datafiles/ima_kexec/Makefile          |  11 ++
>   .../datafiles/{ => ima_kexec}/kexec.policy    |   0
>   .../integrity/ima/datafiles/ima_keys/Makefile |  11 ++
>   .../datafiles/{ => ima_keys}/keycheck.policy  |   2 +-
>   .../ima/datafiles/ima_keys/x509_ima.der       | Bin 0 -> 650 bytes
>   .../ima/datafiles/ima_policy/Makefile         |  11 ++
>   .../datafiles/{ => ima_policy}/measure.policy |   0
>   .../{ => ima_policy}/measure.policy-invalid   |   0
>   .../security/integrity/ima/tests/ima_keys.sh  | 104 +++++++++++++++---
>   11 files changed, 133 insertions(+), 28 deletions(-)
>   create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_kexec/Makefile
>   rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_kexec}/kexec.policy (100%)
>   create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_keys/Makefile
>   rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_keys}/keycheck.policy (59%)
>   create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_keys/x509_ima.der
>   create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_policy/Makefile
>   rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_policy}/measure.policy (100%)
>   rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_policy}/measure.policy-invalid (100%)
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
