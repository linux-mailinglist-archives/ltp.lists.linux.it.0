Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E72CA1EC
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:01:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7228D3C4D07
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:01:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AC87B3C2BEC
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:01:42 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 02659200776
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:01:40 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1BxGXo155674;
 Tue, 1 Dec 2020 12:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=772Pz/tbS77PwXHNBZ9eFTsP9XNa81GKBMABjQEepZA=;
 b=cmgAWYxbNeqK4ALS9jdp9BiQzsmn4Q14Vk8IHXV0qfnmod/rbZVjVOESY6cqg3LzBFms
 Bes5EMvFwZR/OyVH+62uMTNm0eBg9nXKGBs3VQCh21ncdWcpZyJxnPUrRRbaz/RwVcZI
 3pMyjichjXIj5yIN14uNRqtWv0AnuDMDsatDCgKuilSEYLkkiIx7ZSUMan1CNgXvKFSE
 YW0oOAUmOXEWm3alQN+u+6ybVWBfvSjvsoCNm3AsHB79Nzqm49/Vo0RiNx4T5L0f7up9
 LOvHym7st8UhHvdH6zXWJkLG+vuyJGND2k+b/7yK+3DfmP4lJP78Nf2z5FMVj11fbT0q 0Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 353dyqj4bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 12:01:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1BuNcV089400;
 Tue, 1 Dec 2020 12:01:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35404msxke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 12:01:35 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B1C1UoM012551;
 Tue, 1 Dec 2020 12:01:30 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 04:01:30 -0800
To: j.nixdorf@avm.de, LTP List <ltp@lists.linux.it>
References: <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
 <OF2BEB2003.14B7181E-ONC125862D.003F33FC-C125862D.003FF6BA@avm.de>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <28ab3390-a16b-6183-62c8-50d782da2ad6@oracle.com>
Date: Tue, 1 Dec 2020 15:01:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <OF2BEB2003.14B7181E-ONC125862D.003F33FC-C125862D.003FF6BA@avm.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010078
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] netstress: explicitly set a thread stack size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 27.11.2020 14:38, Johannes Nixdorf via ltp wrote:
> Musl libc uses a relatively small thread stack size (128k [1]). This
> gets used up on 2 local buffers sized max_msg_len (64k by default),
> which causes a segfault due to a stack overflow in the error reporting
> path.
> 
> Set the stack size to 256k instead, which is enough for both buffers
> with an additional allowance for the remaining stack usage by netstress
> and called libc or ltp helper functions.
> 
> [1]: https://urldefense.com/v3/__https://wiki.musl-libc.org/functional-differences-from-glibc.html*Thread_stack_size__;Iw!!GqivPVa7Brio!Nat9ZPBR2P2QxOM2IsBWR2WdfOQ1ZNM4IJzjNy5a_bTsHUko9bULz88kJAVK8yQ7Kk8-$ 
> 
> Signed-off-by: Johannes Nixdorf <j.nixdorf@avm.de>
> 
> ---
> 
> v2:
>   - Use a static limit of 256k.
>   - Document the requested stack size in the error message.
>   - Coding style fixup.
> 

Added extra parenthesis to silence possible compiler warnings
and applied, thanks Johannes!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
