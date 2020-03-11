Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E967181B73
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 15:36:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98A113C5F4F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 15:36:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8167A3C5F21
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 15:36:19 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B79DD600860
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 15:36:18 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02BEWmnW162769;
 Wed, 11 Mar 2020 14:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=fSptKWSbawwdJ/vABey3DoyO6btX9v05ajlpqih+3y0=;
 b=DCbAOUvlHQOU4Gyd4pKM0LFbsrV70woNIj/JRNguCxUUw25vmUVup2GtFWjEyLPXzoIt
 RaSsQ77mkYgRKnLbwmHJ3AhHgebVLrXq6/2jyMHNRHySSG+bQlT0iULihrPFIK+twUeM
 hNcVxWZDTwWI2wdZtVWBD1J0VrqXt+85bGyNQCWahQ0ik0uUTrZPRQ1ANICBiBsBWn+9
 p2DyXM8Atj9kTa3cdhC3QjUc32lFrsevLhJzUHFH1NsNwt96Tg0gG+oFrlW8zuQVqeuZ
 a2xlWmySN7aKiIty0GVgm9vu9y0H30QTZohW2reXQWAa0BqFsMKvMFbrF18VfPiddChK XQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2yp9v674bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 14:36:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02BEaAqS095839;
 Wed, 11 Mar 2020 14:36:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2yp8q07j91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 14:36:12 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02BEZgGV028348;
 Wed, 11 Mar 2020 14:35:43 GMT
Received: from [192.168.1.34] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Mar 2020 07:35:42 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: Petr Vorel <pvorel@suse.cz>
References: <20200305192716.10313-1-pvorel@suse.cz>
 <5b00a232-d175-9cb1-ba20-ccd5d6e93cdc@oracle.com>
 <20200310154633.GA25942@dell5510>
Message-ID: <6f07302a-d36b-e824-5f7f-747db510fb75@oracle.com>
Date: Wed, 11 Mar 2020 17:35:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310154633.GA25942@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110093
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] nfs_lib: Unify testing on netns
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
On 10.03.2020 18:46, Petr Vorel wrote:
> Hi Alexey,
> 
> thanks for your review!
> 
>>> There is no need to run tests on opposite client/server when using
>>> $TST_USE_NETNS based setup. It's enough just to set lhost IP address.
>>> This simplifies code a bit.
> 
>> It changes the testcase, this way nfs traffic will go through
>> lo interface, the test won't use ltp_ns_veth* and netns.
> Sorry, I didn't notice this.
> BTW code nfs_setup_server could be run by tst_rhost_run() (code simplification),

Right

> but that's a detail.
> 
>> We could add the knob for this scenario with LTP_NFS_USE_NETNS={1|0}?
> Is this scenario useful? It does not look to me as a real world scenario,
> but if I'm wrong let's add it :).

Perhaps, it can be useful to find out if the test failure
related to veth/netns...

> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
