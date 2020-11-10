Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B12AD8D5
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 15:31:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A0BE3C6054
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 15:31:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B94E63C011E
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 15:31:25 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0D5C5600AE6
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 15:31:24 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AAETFGu165972;
 Tue, 10 Nov 2020 14:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ltaTarQ4kYRZ/bxJ5sgu8F6fVPASUQAgKBnJKlUYWNg=;
 b=GPwzMJTONc3XziS3F7kzOR0toHZscxZL4YdPn2BbugyCnd9DsboeMFASjz/P582ubApv
 4hkc0HN0u+B78vFuWGyrEjUf/LH6gun70iFX//fI/jpt0w7wVT5NA2VcP2qARFsmZu89
 yAmeUNtT8LFVJDmJUd/sMLRNi85/MGAVV6XwctyjBm87ux0h8+gatmStWZwdqfjuCV1c
 6idf+RCfd+njBZ3NwElNITXbnn4mOis9bDnV0tt/sCqR4La9TNgJzDjJtXwtvz6uDdrp
 uoefymvDEoPquRruHoBHkqxm/Oo7b2/S3uwiJIygll7GfDt4/emfPQM26K0OY4HxJerC Lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34p72ehy4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 14:31:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AAEUqF6022181;
 Tue, 10 Nov 2020 14:31:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34p5g0bm0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 14:31:19 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AAEVEtj015886;
 Tue, 10 Nov 2020 14:31:16 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Nov 2020 06:31:14 -0800
To: Petr Vorel <pvorel@suse.cz>, Kory Maincent <kory.maincent@bootlin.com>
References: <20201109191618.4442-1-kory.maincent@bootlin.com>
 <20201110122854.GA30193@pevik> <20201110123616.GA31347@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <48e1bd71-021d-d405-fd67-c35dcd8b53e2@oracle.com>
Date: Tue, 10 Nov 2020 17:31:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110123616.GA31347@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9800
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100104
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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

On 10.11.2020 15:36, Petr Vorel wrote:
> Hi Kory, Alexey,
> 
>> -i option was added in busybox 1.30 (2 years old), it'd be good to note that in
>> the commit message.
> Actually, maybe also test -i option and if even -i not working run?
> 
> tst_brk TCONF "unsupported ping version (old busybox?)"

Hi Petr,

What if it failed for some other reason, it would be a wrong assumption
that ping doesn't support -i...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
